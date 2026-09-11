{
  pkgs,
  themeColors,
  ...
}: {
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

      # Colors
      background-color = themeColors.base;
      text-color = themeColors.text;
      border-color = themeColors.blue;
      progress-color = "over ${themeColors.surface0}";

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
      border-color=${themeColors.blue}
      background-color=${themeColors.base}
      text-color=${themeColors.subtext0}
      default-timeout=3000

      [urgency=normal]
      border-color=${themeColors.blue}
      background-color=${themeColors.base}
      text-color=${themeColors.text}
      default-timeout=5000

      [urgency=critical]
      border-color=${themeColors.red}
      background-color=${themeColors.base}
      text-color=${themeColors.red}
      default-timeout=0
      ignore-timeout=1

      [app-name="Spotify"]
      border-color=${themeColors.green}

      [app-name="volume"]
      border-color=${themeColors.mauve}

      [app-name="brightness"]
      border-color=${themeColors.yellow}

      [app-name="battery"]
      border-color=${themeColors.red}

      [app-name="network"]
      border-color=${themeColors.sky}

      # Grouped notifications
      [grouped]
      format=<b>%s</b> (%g)\\n%b
    '';
  };
}
