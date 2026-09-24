_:
let
  mkRule = kind: matchers: props: {
    ${kind} = {
      _children = map (matcher: { match._props = matcher; }) matchers;
    }
    // props;
  };
  windowRule = mkRule "window-rule";
  layerRule = mkRule "layer-rule";

  floating =
    {
      width,
      height,
      ...
    }@args:
    {
      default-column-width.fixed = width;
      default-window-height.fixed = height;
      open-floating = true;
    }
    // removeAttrs args [
      "width"
      "height"
    ];
in
{
  wayland.windowManager.niri.settings._children = [
    # Wallpaper daemon: also draw it behind the overview.
    (layerRule [ { namespace = "^awww-daemon$"; } ] { place-within-backdrop = true; })

    # ── every window ───────────────────────────────────────────────────
    (windowRule [ ] {
      clip-to-geometry = true;
      geometry-corner-radius = 6.0;
    })

    # ── default sizing ─────────────────────────────────────────────────
    (windowRule [ { app-id = "kitty"; } ] {
      default-column-width.proportion = 0.5;
      open-maximized = false;
    })
    (windowRule
      [
        { app-id = "brave-browser"; }
        { app-id = "zen"; }
        { app-id = "spotify"; }
        { app-id = "ayugram"; }
        { app-id = "code-oss"; }
      ]
      { open-maximized = true; }
    )
    (windowRule [ { app-id = "^org.gnome.Nautilus$"; } ] {
      default-column-width.proportion = 0.5;
      open-floating = false;
      open-maximized = false;
    })

    # ── floating utility windows ───────────────────────────────────────
    (windowRule
      [
        { app-id = "^blueman-manager$"; }
        { app-id = "^\\.blueman-manager-wrapped$"; }
      ]
      (floating {
        width = 600;
        height = 400;
        max-width = 800;
        max-height = 700;
      })
    )
    (windowRule
      [
        { app-id = "^pavucontrol$"; }
        { app-id = "^org\\.pulseaudio\\.pavucontrol$"; }
      ]
      (floating {
        width = 600;
        height = 400;
        max-width = 900;
        max-height = 800;
      })
    )
    (windowRule [ { app-id = "^com\\.gabm\\.satty$"; } ] (floating {
      width = 1200;
      height = 800;
    }))
    (windowRule [ { app-id = "^xdg-desktop-portal-gtk$"; } ] (floating {
      width = 900;
      height = 600;
    }))
    # Picture-in-Picture: small, pinned to the bottom-right corner.
    (windowRule [ { title = "^Picture-in-Picture$"; } ] (floating {
      width = 480;
      height = 270;
      default-floating-position._props = {
        relative-to = "bottom-right";
        x = 32;
        y = 32;
      };
    }))

    # ── system monitors: wide columns ──────────────────────────────────
    (windowRule
      [
        { app-id = "^btop$"; }
        { app-id = "^htop$"; }
      ]
      { default-column-width.proportion = 0.75; }
    )
  ];
}
