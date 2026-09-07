_: {
  wayland.windowManager.niri.settings = {
    prefer-no-csd = [];

    overview.zoom = 0.25;

    hotkey-overlay.skip-at-startup = [];

    layout = {
      background-color = "transparent";
      gaps = 1;
      center-focused-column = "never";

      focus-ring.off = [];

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
        dwt = [];
        dwtp = [];
        natural-scroll = [];
        scroll-method = "two-finger";
        tap = [];
        tap-button-map = "left-right-middle";
        middle-emulation = [];
        accel-profile = "adaptive";
      };

      focus-follows-mouse = [];
    };

    output = [
      {
        _args = ["eDP-1"];
        mode = "1920x1080@59.997";
      }
    ];

    # Wayland environment variables
    environment = {
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
    };
  };
}
