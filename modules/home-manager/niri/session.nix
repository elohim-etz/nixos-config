_: {
  wayland.windowManager.niri.settings = {
    prefer-no-csd = { };
    hotkey-overlay.skip-at-startup = { };

    environment = {
      CLUTTER_BACKEND = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
    };

    _children = map (command: { spawn-at-startup = command; }) [
      "awww-daemon"
      "waybar"
      "set-wallpaper"
    ];
  };
}
