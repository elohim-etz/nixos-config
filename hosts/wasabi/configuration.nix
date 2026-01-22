{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix
    
    # Core system modules
    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/audio.nix
    ../../modules/graphics.nix
    ../../modules/fonts.nix
    ../../modules/sddm.nix
    
    # Window manager
    ../../modules/niri.nix
    
    # System optimization
    ../../modules/zram.nix
    
    # Home Manager integration
    inputs.home-manager.nixosModules.default
  ];

  # Host-specific settings
  networking.hostName = "nixos";
  time.timeZone = "Asia/Kolkata";

  # Localization
  i18n.defaultLocale = "en_US.UTF-8";

  # Nix configuration
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User configuration
  users.users.naveen = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Essential system packages
  environment.systemPackages = with pkgs; [
    wget
    git
    gnupg
    htop
    brightnessctl
    unzip
  ];

  # System services
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.zsh.enable = true;

  # Home Manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.naveen = import ../../home/home.nix;
    backupFileExtension = "backup";
  };

  # State version
  system.stateVersion = "25.11";
}
