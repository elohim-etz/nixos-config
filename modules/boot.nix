{ config, lib, pkgs, ... }:

{
  boot = {
    # Bootloader configuration
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # Intel graphics kernel modules
    kernelModules = [ "i915" ];
    
    # Early KMS for smoother boot
    initrd.kernelModules = [ "i915" ];

    # Kernel parameters for better performance
    kernel.sysctl = {
      "vm.swappiness" = 20;
      "vm.page-cluster" = 3;
    };
  };
}
