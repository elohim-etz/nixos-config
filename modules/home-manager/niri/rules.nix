_: {
  wayland.windowManager.niri.settings.layer-rule = [
    {
      match._props.namespace = "^quickshell-overview$";
      place-within-backdrop = true;
    }
    {
      match._props.namespace = "^awww-daemon$";
      place-within-backdrop = true;
    }
  ];

  wayland.windowManager.niri.settings.window-rule = [
    {
      clip-to-geometry = true;
      geometry-corner-radius = 6.0;
    }

    {
      match._props.app-id = "kitty";
      open-maximized = false;
      default-column-width.proportion = 0.5;
    }
    {
      match._props.app-id._raw = ''r#"^org\.wezfurlong\.wezterm$"#'';
      default-column-width.proportion = 0.5;
    }

    {
      match = [
        {_props.app-id = "brave-browser";}
        {_props.app-id = "zen";}
        {_props.app-id = "spotify";}
        {_props.app-id = "ayugram";}
        {_props.app-id = "code-oss";}
      ];
      open-maximized = true;
    }

    {
      match._props.app-id = "^org.gnome.Nautilus$";
      open-floating = false;
      open-maximized = false;
      default-column-width.proportion = 0.5;
    }

    {
      match = [
        {_props.app-id._raw = ''r#"^org\.keepassxc\.KeePassXC$"#'';}
        {_props.app-id._raw = ''r#"^org\.gnome\.World\.Secrets$"#'';}
      ];
      block-out-from = "screen-capture";
    }

    {
      match._props.app-id._raw = ''r#"^com\.gabm\.satty$"#'';
      open-floating = true;
      default-column-width.fixed = 1200;
      default-window-height.fixed = 800;
    }

    {
      match._props.app-id = "^xdg-desktop-portal-gtk$";
      open-floating = true;
      default-column-width.fixed = 900;
      default-window-height.fixed = 600;
    }

    {
      match._props.title = "^Picture-in-Picture$";
      open-floating = true;
      default-column-width.fixed = 480;
      default-window-height.fixed = 270;
      default-floating-position._props = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
    }

    {
      match = [
        {_props.app-id = "^btop$";}
        {_props.app-id = "^htop$";}
      ];
      default-column-width.proportion = 0.75;
    }
  ];
}
