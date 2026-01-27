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

  # Audio control tools
  environment.systemPackages = with pkgs; [
    playerctl
    pavucontrol
  ];
}
