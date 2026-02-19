{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    
    settings = {
      # Positioning
      anchor = "top-right";
      margin = "10";
      padding = "15";
      
      # Dimensions
      width = 380;
      height = 150;
      
      # Border and styling
      border-size = 2;
      border-radius = 10;
      
      # Colors - Catppuccin Mocha
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
      progress-color = "over #313244";
      
      # Font
      font = "JetBrainsMono Nerd Font 12";
      
      # Behavior
      default-timeout = 5000;
      ignore-timeout = false;
      
      # Icons
      icons = true;
      max-icon-size = 48;
      icon-path = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
      
      # Text formatting
      markup = true;
      format = "<b>%s</b>\\n%b";
      max-visible = 3;
      
      # Grouping
      group-by = "app-name";
      
      # Sorting
      sort = "-time";
      
      # Layer
      layer = "overlay";
    };
    
    extraConfig = ''
      # Urgency-specific styling
      [urgency=low]
      border-color=#89b4fa
      background-color=#1e1e2e
      text-color=#a6adc8
      default-timeout=3000

      [urgency=normal]
      border-color=#89b4fa
      background-color=#1e1e2e
      text-color=#cdd6f4
      default-timeout=5000

      [urgency=critical]
      border-color=#f38ba8
      background-color=#1e1e2e
      text-color=#f38ba8
      default-timeout=0
      ignore-timeout=1

      # App-specific styling
      [app-name="Spotify"]
      border-color=#a6e3a1
      
      [app-name="volume"]
      border-color=#cba6f7

      [app-name="brightness"]
      border-color=#f9e2af

      [app-name="battery"]
      border-color=#f38ba8

      [app-name="network"]
      border-color=#89dceb

      # Grouped notifications
      [grouped]
      format=<b>%s</b> (%g)\\n%b
    '';
  };
}
