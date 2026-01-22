{ config, pkgs, lib, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    
    theme = "sddm-astronaut-theme";
    
    extraPackages = with pkgs.kdePackages; [
      qtsvg
      qtmultimedia
      qtvirtualkeyboard
      custom-sddm-astronaut
    ];
    
    # SDDM settings
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = "24";
      };
      General = {
        DefaultSession = "niri.desktop";
      };
      Wayland = {
        EnableHiDPI = true;
      };
    };
  };

  environment.systemPackages = [
    custom-sddm-astronaut
    pkgs.bibata-cursors
  ];

  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}