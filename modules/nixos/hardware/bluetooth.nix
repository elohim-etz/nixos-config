{ config, lib, pkgs, ... }:

{
  # Bluetooth support
  hardware.bluetooth = {
    enable = true;
  };
}
