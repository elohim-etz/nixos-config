{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.kernel;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.my.kernel = {
    enable = mkEnableOption "the custom-configured kernel (built by CI and served from the binary cache)";

    base = mkOption {
      type = types.package;
      default = pkgs.linuxPackages_latest.kernel;
      defaultText = lib.literalExpression "pkgs.linuxPackages_latest.kernel";
      description = "Kernel derivation to customise. Use a mainline-family kernel (linux_latest, linux_6_x).";
    };

    hz = mkOption {
      type = types.enum [100 250 300 1000];
      default = 1000;
      description = "Timer frequency. 1000 = lowest latency, 250/300 = less overhead.";
    };

    preempt = mkOption {
      type = types.enum ["none" "voluntary" "full" "lazy"];
      default = "full";
      description = ''
        Preemption model. `full` is best for desktop latency; `lazy` (kernel
        6.13+) is the newer middle ground. Switchable at boot via preempt=
        because PREEMPT_DYNAMIC is enabled.
      '';
    };

    march = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "x86-64-v3";
      description = ''
        Passed as KCFLAGS=-march=<value>. Must be something every machine that
        boots this closure supports (check `grep -o avx2 /proc/cpuinfo` before
        using x86-64-v3). Never "native": CI's CPU is not yours.
      '';
    };

    schedExt = mkOption {
      type = types.bool;
      default = true;
      description = "Enable sched_ext so scx_* schedulers can be loaded.";
    };

    scx = {
      enable = mkEnableOption "an sched_ext userspace scheduler (services.scx)";
      scheduler = mkOption {
        type = types.str;
        default = "scx_lavd";
        description = "Scheduler binary, e.g. scx_lavd (interactive/laptop) or scx_bpfland.";
      };
    };

    tcpBbr = mkOption {
      type = types.bool;
      default = true;
      description = "BBR congestion control + fq qdisc (as module + sysctl, no kernel rebuild needed).";
    };

    structuredExtraConfig = mkOption {
      type = types.attrsOf types.anything;
      default = {};
      example = lib.literalExpression ''with lib.kernel; { DEBUG_INFO_BTF = yes; }'';
      description = "Extra Kconfig settings (lib.kernel helpers). Forced over nixpkgs' defaults.";
    };

    extraPatches = mkOption {
      type = types.listOf types.attrs;
      default = [];
      example = lib.literalExpression ''[ { name = "bore"; patch = ./bore.patch; } ]'';
      description = "Extra kernelPatches ({ name; patch; extraStructuredConfig?; }).";
    };

    extraMakeFlags = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "Extra make flags.";
    };

    strict = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Fail the build when a config option is unknown or not applied (catches
        typos and options removed in newer kernels). Disable only to unblock.
      '';
    };

    stockFallback = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Add a boot entry "stock-kernel" with the unmodified nixpkgs kernel, so a
        bad custom kernel never locks you out. Its kernel comes from
        cache.nixos.org, so it adds almost no CI time.
      '';
    };
  };

  config = mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.mkCustomKernel {
      inherit (cfg) base hz preempt march schedExt strict extraMakeFlags structuredExtraConfig extraPatches;
    });

    boot.kernelModules = mkIf cfg.tcpBbr ["tcp_bbr"];
    boot.kernel.sysctl = mkIf cfg.tcpBbr {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
    };

    services.scx = mkIf cfg.scx.enable {
      enable = true;
      inherit (cfg.scx) scheduler;
    };

    specialisation = mkIf cfg.stockFallback {
      stock-kernel.configuration = {
        my.kernel.enable = lib.mkForce false;
      };
    };
  };
}
