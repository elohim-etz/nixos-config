{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix
    
    # All system modules
    ../../modules/nixos

    # System packages
    ../../pkgs/nixos

    # Home Manager integration
    inputs.home-manager.nixosModules.default
  ];

  # Host-specific settings
  networking.hostName = "nixos";

  # Home Manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.naveen = import ../../home/home.nix;
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # State version - DO NOT CHANGE
  system.stateVersion = "25.11";
}
