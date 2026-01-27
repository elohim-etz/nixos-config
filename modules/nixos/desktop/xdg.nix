{ config, lib, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    
    # Portal implementations
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
