_: {
  wayland.windowManager.niri.settings = {
    input = {
      # focus-follows-mouse = { };

      keyboard = {
        repeat-delay = 250;
        repeat-rate = 50;
        xkb.layout = "us";
      };

      touchpad = {
        accel-profile = "adaptive";
        click-method = "button-areas";
        dwt = { };
        dwtp = { };
        middle-emulation = { };
        natural-scroll = { };
        scroll-method = "two-finger";
        tap = { };
        tap-button-map = "left-right-middle";
      };
    };

    _children = [
      {
        output = {
          _args = [ "eDP-1" ];
          mode = "1920x1080@59.997";
        };
      }
    ];
  };
}
