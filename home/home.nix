{ config, pkgs, inputs, ... }:

{
  home = {
    username = "naveen";
    homeDirectory = "/home/naveen";
    stateVersion = "25.11";
  };

  imports = [
    ./modules/packages.nix
    ./modules/shell.nix
    ./modules/ui.nix
    
    ./niri
    
    ./programs/kitty
    ./programs/vscodium
    ./programs/gitconfig
    ./programs/starship
    ./programs/mpv
    ./programs/zsh
    ./programs/fastfetch
    ./programs/neovim
    ./programs/spicetify
    ./programs/zen
    ./programs/brave
    ./programs/noctalia
  ];

  nixpkgs.config.allowUnfree = true;
  
  programs.home-manager.enable = true;
}
