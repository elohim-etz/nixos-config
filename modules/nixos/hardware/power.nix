{ config, lib, pkgs, ... }:

{
  # Power management services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # TODO: TLP

  # System packages for power management
  environment.systemPackages = with pkgs; [
    powertop
    acpi
  ];
}
