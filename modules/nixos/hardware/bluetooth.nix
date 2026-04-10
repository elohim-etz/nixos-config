{ config, lib, pkgs, ... }:

{
  # Bluetooth support
  hardware.bluetooth = {
    enable = true;
  };

  services.blueman.enable = true;
}
