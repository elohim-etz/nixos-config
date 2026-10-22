final: prev: let
  inherit (prev) lib;
  inherit (lib.kernel) yes no option freeform;
in {
  mkCustomKernel = {
    base ? final.linuxPackages_latest.kernel,
    hz ? 1000,
    preempt ? "full",
    march ? null,
    schedExt ? true,
    structuredExtraConfig ? {},
    extraPatches ? [],
    extraMakeFlags ? [],
    strict ? true,
  }: let
    preemptSymbol =
      {
        none = "PREEMPT_NONE";
        voluntary = "PREEMPT_VOLUNTARY";
        full = "PREEMPT";
        lazy = "PREEMPT_LAZY";
      }.${
        preempt
      };

    preemptConfig =
      {
        PREEMPT_NONE = option no;
        PREEMPT_VOLUNTARY = option no;
        PREEMPT = option no;
        PREEMPT_LAZY = option no;
        PREEMPT_DYNAMIC = option yes;
      }
      // {${preemptSymbol} = yes;};

    hzConfig =
      {
        HZ_100 = no;
        HZ_250 = no;
        HZ_300 = no;
        HZ_1000 = no;
      }
      // {
        "HZ_${toString hz}" = yes;
        HZ = freeform (toString hz);
      };

    schedExtConfig = lib.optionalAttrs schedExt {
      SCHED_CLASS_EXT = option yes;
    };

    ours = lib.mapAttrs (_: lib.mkForce) (preemptConfig // hzConfig // schedExtConfig // structuredExtraConfig);
  in
    assert lib.assertOneOf "hz" hz [100 250 300 1000];
    assert lib.assertOneOf "preempt" preempt ["none" "voluntary" "full" "lazy"];
      base.override (old: {
        structuredExtraConfig = (old.structuredExtraConfig or {}) // ours;
        kernelPatches = (old.kernelPatches or []) ++ extraPatches;
        extraMakeFlags =
          (old.extraMakeFlags or [])
          ++ lib.optional (march != null) "KCFLAGS=-march=${march}"
          ++ extraMakeFlags;
        ignoreConfigErrors = !strict;
      });
}
