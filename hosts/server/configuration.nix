{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Home Manager
    inputs.home-manager.nixosModules.home-manager

    # Shared NixOS modules
    ../../modules/nixos/core/system.nix
    ../../modules/nixos/core/users.nix
    ../../modules/nixos/optimization

    ../../pkgs/nixos
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
    };

    users.naveen = import ./home.nix;
  };

  networking.hostName = "server";

  # SSH
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
    git
    htop
    btop
    tmux
    ripgrep
    fd
    jq
    unzip
  ];

  system.stateVersion = "25.11";
}
