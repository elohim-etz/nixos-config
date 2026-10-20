{
  lib,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    # Default kernel. modules/nixos/kernel overrides this (normal priority beats
    # mkDefault) when my.kernel.enable = true.
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

    kernelModules = ["i915"];
    initrd.kernelModules = ["i915"]; # early KMS

    kernel.sysctl = {
      "vm.swappiness" = 100;
      "vm.page-cluster" = 0;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
    };

    tmp.cleanOnBoot = true;
  };
}
