{ config, pkgs, inputs, ... }:

{
  home = {
    username = "naveen";
    homeDirectory = "/home/naveen";
    stateVersion = "25.11";
  };

  imports = [
    ../pkgs/home-manager
    ../modules/home-manager
  ];

  nixpkgs.config.allowUnfree = true;
  
  programs.home-manager.enable = true;
}
