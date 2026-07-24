_: {
  # Note the singular node names (`layer-rule`, `window-rule`, `match`) -
  # these mirror niri's actual KDL node names, which repeat as siblings for
  # multiple rules/multiple OR-matches, rather than sodiboo's plural
  # `layer-rules`/`window-rules`/`matches` wrapper attributes.

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
    # No `match` here at all -> applies to every window, same as in niri's
    # own KDL when a window-rule has no match block.
    {
      clip-to-geometry = true;
      # All four corners are equal, so the single-argument form is enough
      # instead of spelling out top-left/top-right/bottom-left/bottom-right.
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
      # Multiple `match` entries under one rule = OR, same as sodiboo's
      # single `matches` list did.
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
      match = [
        {_props.app-id = "^blueman-manager$";}
        {_props.app-id._raw = ''r#"^\.blueman-manager-wrapped$"#'';}
      ];
      open-floating = true;
      default-column-width.fixed = 600;
      default-window-height.fixed = 400;
      max-width = 800;
      max-height = 700;
    }

    {
      match = [
        {_props.app-id = "^pavucontrol$";}
        {_props.app-id._raw = ''r#"^org\.pulseaudio\.pavucontrol$"#'';}
      ];
      open-floating = true;
      default-column-width.fixed = 600;
      default-window-height.fixed = 400;
      max-width = 900;
      max-height = 800;
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
