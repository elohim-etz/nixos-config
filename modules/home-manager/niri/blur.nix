_: {
  wayland.windowManager.niri.settings.blur = {
    passes = 2;
    offset = 5;
    noise = 0.015;
    saturation = 1.25;
  };

  # Layer-shell surfaces: wofi, waybar, wlogout
  wayland.windowManager.niri.settings.layer-rule = [
    {
      match._props.namespace = "^waybar$";
      background-effect.blur = true;
    }
    {
      match._props.namespace = "^wlogout$";
      background-effect.blur = true;
    }
  ];

  # Regular windows: kitty, nautilus
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
