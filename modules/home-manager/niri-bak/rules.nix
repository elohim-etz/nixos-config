_: {
  programs.niri.settings = {

    layer-rules = [
      {
        matches = [{namespace = "^quickshell-overview$";}];
        place-within-backdrop = true;
      }
      {
        matches = [{namespace = "^awww-daemon$";}];
        place-within-backdrop = true;
      }
    ];

    window-rules = [

      {
        clip-to-geometry = true;
        geometry-corner-radius = {
          top-left = 6.0;
          top-right = 6.0;
          bottom-left = 6.0;
          bottom-right = 6.0;
        };
      }

      {
        matches = [{app-id = "kitty";}];
        open-maximized = false;
        default-column-width.proportion = 0.5;
      }
      {
        matches = [{app-id = "^org\\.wezfurlong\\.wezterm$";}];
        default-column-width.proportion = 0.5;
      }

      {
        matches = [
          {app-id = "brave-browser";}
          {app-id = "zen";}
          {app-id = "spotify";}
          {app-id = "ayugram";}
          {app-id = "code-oss";}
        ];
        open-maximized = true;
      }

      {
        matches = [{app-id = "^org.gnome.Nautilus$";}];
        open-floating = false;
        open-maximized = false;
        default-column-width.proportion = 0.5;
      }

      {
        matches = [
          {app-id = "^org\\.keepassxc\\.KeePassXC$";}
          {app-id = "^org\\.gnome\\.World\\.Secrets$";}
        ];
        block-out-from = "screen-capture";
      }

      {
        matches = [
          {app-id = "^blueman-manager$";}
          {app-id = "^\\.blueman-manager-wrapped$";}
        ];
        open-floating = true;
        default-column-width.fixed = 600;
        default-window-height.fixed = 400;
        max-width = 800;
        max-height = 700;
      }

      {
        matches = [
          {app-id = "^pavucontrol$";}
          {app-id = "^org\\.pulseaudio\\.pavucontrol$";}
        ];
        open-floating = true;
        default-column-width.fixed = 600;
        default-window-height.fixed = 400;
        max-width = 900;
        max-height = 800;
      }

      {
        matches = [{app-id = "^com\\.gabm\\.satty$";}];
        open-floating = true;
        default-column-width.fixed = 1200;
        default-window-height.fixed = 800;
      }

      {
        matches = [{app-id = "^xdg-desktop-portal-gtk$";}];
        open-floating = true;
        default-column-width.fixed = 900;
        default-window-height.fixed = 600;
      }

      {
        matches = [{title = "^Picture-in-Picture$";}];
        open-floating = true;
        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }

      {
        matches = [
          {app-id = "^btop$";}
          {app-id = "^htop$";}
        ];
        default-column-width.proportion = 0.75;
      }
    ];
  };
}
