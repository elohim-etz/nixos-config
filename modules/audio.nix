{ config, lib, pkgs, ... }:

{
  # PipeWire audio configuration
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  # Power management for audio
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # System packages for audio control
  environment.systemPackages = with pkgs; [
    playerctl
    upower
    power-profiles-daemon
  ];
}
