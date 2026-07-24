_: {
  # ─────────────────────────────────────────────────────────────────────────
  # Blur (niri >= 26.04, via the native `ext-background-effect` support).
  # This is the thing sodiboo's flake never got support for.
  #
  # How it works:
  #   - The top-level `blur {}` block just tunes quality/cost for ANY blur
  #     that ends up active - it does not turn blur on anywhere by itself.
  #   - Blur is actually switched on per-surface with a `background-effect`
  #     block inside a `window-rule` (regular windows) or `layer-rule`
  #     (bars/menus/launchers on the layer-shell), each targeted by an
  #     app-id/namespace match.
  #   - Whenever background-effect.blur is on, niri defaults to "xray" mode:
  #     it blurs the wallpaper once and reuses that single blurred texture
  #     everywhere, instead of re-blurring everything under every surface on
  #     every frame. That's the cheap path, and it's why we never set
  #     `xray = false` below - doing so would opt into the expensive,
  #     currently-experimental non-xray blur instead.
  #
  # For the blur to actually be visible, the target also needs some
  # transparency in its own theme/config (an opaque window just fully covers
  # whatever's blurred behind it) - so pair this with slightly translucent
  # backgrounds in your wofi/waybar/wlogout/kitty/nautilus themes.
  # ─────────────────────────────────────────────────────────────────────────

  wayland.windowManager.niri.settings.blur = {
    # Lower passes + a bit more offset gives a soft, cheap blur instead of
    # niri's (still fairly light) defaults of passes=3/offset=3. Increase
    # `offset` further first if you want it softer - that's the free knob;
    # only bump `passes` back up if you start seeing banding artifacts.
    passes = 2;
    offset = 6;
    noise = 0.02;
    saturation = 1.4;
  };

  # ── Layer-shell surfaces: wofi, waybar, wlogout ─────────────────────────────
  wayland.windowManager.niri.settings.layer-rule = [
    {
      match._props.namespace = "^wofi$";
      background-effect.blur = true;
    }
    {
      match._props.namespace = "^waybar$";
      background-effect.blur = true;
    }
    {
      match._props.namespace = "^wlogout$";
      background-effect.blur = true;
    }
  ];

  # ── Regular windows: kitty, nautilus ────────────────────────────────────────
  wayland.windowManager.niri.settings.window-rule = [
    {
      match._props.app-id = "kitty";
      background-effect.blur = true;
    }
    {
      match._props.app-id = "^org.gnome.Nautilus$";
      background-effect.blur = true;
    }
  ];
}
