{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix
    
    # All system modules
    ../../modules/nixos

    # System packages
    ../../pkgs/nixos
  ];

  # Host-specific settings
  networking.hostName = "nixos";

  # State version - DO NOT CHANGE
  system.stateVersion = "25.11";
}
