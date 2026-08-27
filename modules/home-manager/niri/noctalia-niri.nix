_: {
  wayland.windowManager.niri.settings = {
    debug = {
      honor-xdg-activation-with-invalid-serial = true;
    };

    binds = {
      "Mod+A".spawn._args = [ "sh" "-c" "noctalia msg panel-toggle launcher" ];
      "Mod+S".spawn._args = [ "sh" "-c" "noctalia msg panel-toggle control-center" ];
      "Alt+Tab".spawn._args = [ "sh" "-c" "noctalia msg window-switcher" ];
      "Mod+P".spawn._args = [ "sh" "-c" "noctalia msg screenshot-region" ];
      "Ctrl+Alt+Delete".spawn._args = [ "sh" "-c" "noctalia msg sessionMenu" ];

      # Audio
      "XF86AudioRaiseVolume".spawn._args = [ "sh" "-c" "noctalia msg volume-up" ];
      "XF86AudioLowerVolume".spawn._args = [ "sh" "-c" "noctalia msg volume-down" ];
      "XF86AudioMute".spawn._args = [ "sh" "-c" "noctalia msg volume-mute" ];
      "XF86AudioMicMute".spawn._args = [ "sh" "-c" "noctalia msg mic-mute" ];

      # Laptop Fn-row audio fallbacks
      "F2".spawn._args = [ "sh" "-c" "noctalia msg volume-down" ];
      "F3".spawn._args = [ "sh" "-c" "noctalia msg volume-up" ];
      "F4".spawn._args = [ "sh" "-c" "noctalia msg volume-mute" ];

      # Media
      "XF86AudioPlay".spawn._args = [ "sh" "-c" "noctalia msg media toggle" ];
      "XF86AudioStop".spawn._args = [ "sh" "-c" "noctalia msg media stop" ];
      "XF86AudioPrev".spawn._args = [ "sh" "-c" "noctalia msg media previous" ];
      "XF86AudioNext".spawn._args = [ "sh" "-c" "noctalia msg media next" ];

      # Laptop Fn-row media fallbacks
      "F1".spawn._args = [ "sh" "-c" "noctalia msg media toggle" ];
      "F5".spawn._args = [ "sh" "-c" "noctalia msg media previous" ];
      "F6".spawn._args = [ "sh" "-c" "noctalia msg media next" ];

      # Brightness
      "XF86MonBrightnessUp".spawn._args = [ "sh" "-c" "noctalia msg brightness-up" ];
      "XF86MonBrightnessDown".spawn._args = [ "sh" "-c" "noctalia msg brightness-down" ];

      # Laptop Fn-row brightness fallbacks
      "F11".spawn._args = [ "sh" "-c" "noctalia msg brightness-down" ];
      "F12".spawn._args = [ "sh" "-c" "noctalia msg brightness-up" ];
    };

    overview = {
      workspace-shadow = {
        off = [ ];
      };
    };
  };
}
