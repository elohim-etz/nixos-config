{inputs, ...}: {
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager

    # All system modules
    ../../modules/nixos

    # System packages
    ../../pkgs/nixos
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.naveen = import ../../home/home.nix;
  };

  # Host-specific settings
  networking.hostName = "nixos";

  # State version - DO NOT CHANGE
  system.stateVersion = "25.11";
}
