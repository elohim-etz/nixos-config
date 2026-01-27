{ config, lib, pkgs, ... }:

{
  # User configuration
  users.users.naveen = {
    isNormalUser = true;
    description = "Naveen";
    extraGroups = [ 
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };
}
