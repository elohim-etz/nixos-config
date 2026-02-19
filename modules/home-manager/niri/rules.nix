{
  ...
}:

{
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [
          {
            namespace = "^quickshell-overview$";
          }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          {
            namespace = "^swww-daemon$";
          }
        ];
        place-within-backdrop = true;
      }
    ];

    layout = {
      gaps = 2;
      center-focused-column =  "never";
    };

    window-rules = [
      # WezTerm – half width
      {
        matches = [
          { app-id = "^org\\.wezfurlong\\.wezterm$"; }
        ];
        default-column-width.proportion = 0.5;
      }
    
      # Password managers – block from screen capture
      {
        matches = [
          { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
        ];
        block-out-from = "screen-capture";
      }
      {
        matches = [
          { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
        ];
        block-out-from = "screen-capture";
      }
    
      # Kitty – half width, not maximized
      {
        matches = [
          { app-id = "kitty"; }
        ];
        open-maximized = false;
        default-column-width.proportion = 0.5;
      }
    
      {
        clip-to-geometry = true;
        geometry-corner-radius = {
          top-left = 6.0;
          top-right = 6.0;
          bottom-left = 6.0;
          bottom-right = 6.0;
        };
      }
    
      # Browsers / IDE / chat – open maximized
      {
        matches = [ { app-id = "brave-browser"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "spotify"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "zen"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "ayugram"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "code-oss"; } ];
        open-maximized = true;
      }
    
      # Blueman manager – floating dialog
      {
        matches = [
          { app-id = "^blueman-manager$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 600;
        default-window-height.fixed = 400;
        max-width = 800;
        max-height = 700;
      }
      {
        matches = [
          { app-id = "^\\.blueman-manager-wrapped$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 600;
        default-window-height.fixed = 400;
        max-width = 800;
        max-height = 700;
      }
    
      # xdg portal dialog
      {
        matches = [
          { app-id = "^xdg-desktop-portal-gtk$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 900;
        default-window-height.fixed = 600;
      }
    
      # Pavucontrol
      {
        matches = [
          { app-id = "^pavucontrol$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 600;
        default-window-height.fixed = 400;
        max-width = 900;
        max-height = 800;
      }
      {
        matches = [
          { app-id = "^org\\.pulseaudio\\.pavucontrol$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 600;
        default-window-height.fixed = 400;
        max-width = 900;
        max-height = 800;
      }
    
      # Nautilus file manager
      {
        matches = [
          { app-id = "^org.gnome.Nautilus$"; }
        ];
        open-floating = false;
        open-maximized = false;
        default-column-width.proportion = 0.5;
      }
    
      # Picture in Picture
      {
        matches = [
          { title = "^Picture-in-Picture$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }
    
      # Calculators
      {
        matches = [
          { app-id = "^org\\.gnome\\.Calculator$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 400;
        default-window-height.fixed = 500;
      }
      {
        matches = [
          { app-id = "^gnome-calculator$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 400;
        default-window-height.fixed = 500;
      }
      {
        matches = [
          { app-id = "^kcalc$"; }
        ];
        open-floating = true;
        default-column-width.fixed = 400;
        default-window-height.fixed = 500;
      }
    
      # btop / htop – wider columns
      {
        matches = [
          { app-id = "^btop$"; }
        ];
        default-column-width.proportion = 0.75;
      }
      {
        matches = [
          { app-id = "^htop$"; }
        ];
        default-column-width.proportion = 0.75;
      }
    ];
  };
}
