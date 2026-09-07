{pkgs, ...}: {
  # Power management services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # System packages for power management
  environment.systemPackages = with pkgs; [
    powertop
    acpi
  ];
}
