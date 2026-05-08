_: {
  programs.niri.settings = {
    prefer-no-csd = true;

    overview.zoom = 0.25;

    hotkey-overlay.skip-at-startup = true;

    layout = {
      background-color = "transparent";
      gaps = 2;
      center-focused-column = "never";

      focus-ring.enable = false;

      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };

      default-column-width.proportion = 1.0;
    };

    input = {
      keyboard.xkb.layout = "us";

      touchpad = {
        click-method = "button-areas";
        dwt = true;
        dwtp = true;
        natural-scroll = true;
        scroll-method = "two-finger";
        tap = true;
        tap-button-map = "left-right-middle";
        middle-emulation = true;
        accel-profile = "adaptive";
      };

      focus-follows-mouse.enable = true;
      warp-mouse-to-focus.enable = false;
    };

    outputs."eDP-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 59.997;
      };
    };

    # Wayland environment variables
    environment = {
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
      DISPLAY = ":0";
    };
  };
}
