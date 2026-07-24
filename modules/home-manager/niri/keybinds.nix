_: {
   wayland.windowManager.niri.settings.binds = {

    # ── Launchers ──────────────────────────────────────────────────────────────
    "Mod+A"         = {spawn = ["sh" "-c" "pkill wofi || wofi --show drun"];};
    "Mod+T"         = {spawn = ["kitty"];};
    "Mod+E"         = {spawn = ["nautilus"];};
    "Ctrl+Alt+Delete" = {spawn = ["wlogout"];};

    # ── System ────────────────────────────────────────────────────────────────
    "Mod+Shift+E" = {quit = [];};
    "Mod+Shift+P" = {power-off-monitors = [];};
    "Mod+Escape"  = {
      _props.allow-inhibiting = false;
      toggle-keyboard-shortcuts-inhibit = [];
    };

    # ── Audio ─────────────────────────────────────────────────────────────────
    "XF86AudioRaiseVolume" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
    };
    "XF86AudioLowerVolume" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
    };
    "XF86AudioMute" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
    "XF86AudioMicMute" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };
    # Laptop Fn-row audio fallbacks
    "F2" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
    };
    "F3" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
    };
    "F4" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
    "Alt+F4" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };

    # ── Media ─────────────────────────────────────────────────────────────────
    "XF86AudioPlay" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl play-pause";
    };
    "XF86AudioStop" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl stop";
    };
    "XF86AudioPrev" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl previous";
    };
    "XF86AudioNext" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl next";
    };
    # Laptop Fn-row media fallbacks
    "F1" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl play-pause";
    };
    "F5" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl previous";
    };
    "F6" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl next";
    };

    # ── Brightness ────────────────────────────────────────────────────────────
    "XF86MonBrightnessUp" = {
      _props.allow-when-locked = true;
      spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
    };
    "XF86MonBrightnessDown" = {
      _props.allow-when-locked = true;
      spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
    };
    # Laptop Fn-row brightness fallbacks
    "F11" = {
      _props.allow-when-locked = true;
      spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
    };
    "F12" = {
      _props.allow-when-locked = true;
      spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
    };

    # ── Screenshots ───────────────────────────────────────────────────────────
    "Mod+P"    = {spawn-sh = ''grim -g "$(slurp)" - | satty -f -'';};
    "Print"    = {screenshot = [];};
    "Ctrl+Print" = {screenshot-screen = [];};
    "Alt+Print"  = {screenshot-window = [];};

    # ── Wallpaper ─────────────────────────────────────────────────────────────
    "Mod+Shift+W" = {spawn = ["wallpaper-picker"];};

    # ── Window management ─────────────────────────────────────────────────────
    "Mod+Return" = {
      _props.repeat = false;
      toggle-overview = [];
    };
    "Mod+Q" = {
      _props.repeat = false;
      close-window = [];
    };

    # Focus – arrow keys
    "Mod+Left"  = {focus-column-left = [];};
    "Mod+Right" = {focus-column-right = [];};
    "Mod+Up"    = {focus-workspace-up = [];};
    "Mod+Down"  = {focus-workspace-down = [];};
    # Focus – vim keys
    "Mod+H" = {focus-column-left = [];};
    "Mod+L" = {focus-column-right = [];};
    "Mod+J" = { focus-window-or-workspace-down = []; };
    "Mod+K" = { focus-window-or-workspace-up = []; };
    # Focus – extremes
    "Mod+Home" = {focus-column-first = [];};
    "Mod+End"  = {focus-column-last = [];};

    # Move – arrow keys
    "Mod+Ctrl+Left"  = {move-column-left = [];};
    "Mod+Ctrl+Right" = {move-column-right = [];};
    "Mod+Ctrl+Up"    = {move-window-up = [];};
    "Mod+Ctrl+Down"  = {move-window-down = [];};
    # Move – vim keys
    "Mod+Ctrl+H" = {move-column-left = [];};
    "Mod+Ctrl+L" = {move-column-right = [];};
    "Mod+Ctrl+K" = {move-window-up = [];};
    "Mod+Ctrl+J" = {move-window-down = [];};
    # Move – extremes
    "Mod+Ctrl+Home" = {move-column-to-first = [];};
    "Mod+Ctrl+End"  = {move-column-to-last = [];};

    # ── Mouse-wheel navigation ────────────────────────────────────────────────
    "Mod+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      focus-workspace-down = [];
    };
    "Mod+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      focus-workspace-up = [];
    };
    "Mod+Ctrl+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-down = [];
    };
    "Mod+Ctrl+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-up = [];
    };
    "Mod+WheelScrollRight"      = {focus-column-right = [];};
    "Mod+WheelScrollLeft"       = {focus-column-left = [];};
    "Mod+Ctrl+WheelScrollRight" = {move-column-right = [];};
    "Mod+Ctrl+WheelScrollLeft"  = {move-column-left = [];};
    "Mod+Shift+WheelScrollDown" = {focus-column-right = [];};
    "Mod+Shift+WheelScrollUp"   = {focus-column-left = [];};
    "Mod+Ctrl+Shift+WheelScrollDown" = {move-column-right = [];};
    "Mod+Ctrl+Shift+WheelScrollUp"   = {move-column-left = [];};

    # ── Workspaces ────────────────────────────────────────────────────────────
    "Mod+1" = {focus-workspace = 1;};
    "Mod+2" = {focus-workspace = 2;};
    "Mod+3" = {focus-workspace = 3;};
    "Mod+4" = {focus-workspace = 4;};
    "Mod+5" = {focus-workspace = 5;};
    "Mod+6" = {focus-workspace = 6;};
    "Mod+7" = {focus-workspace = 7;};
    "Mod+8" = {focus-workspace = 8;};
    "Mod+9" = {focus-workspace = 9;};

    "Mod+Shift+1" = {move-column-to-workspace = 1;};
    "Mod+Shift+2" = {move-column-to-workspace = 2;};
    "Mod+Shift+3" = {move-column-to-workspace = 3;};
    "Mod+Shift+4" = {move-column-to-workspace = 4;};
    "Mod+Shift+5" = {move-column-to-workspace = 5;};
    "Mod+Shift+6" = {move-column-to-workspace = 6;};
    "Mod+Shift+7" = {move-column-to-workspace = 7;};
    "Mod+Shift+8" = {move-column-to-workspace = 8;};
    "Mod+Shift+9" = {move-column-to-workspace = 9;};

    # ── Column operations ─────────────────────────────────────────────────────
    "Mod+BracketLeft"  = {consume-or-expel-window-left = [];};
    "Mod+BracketRight" = {consume-or-expel-window-right = [];};
    "Mod+Comma"  = {consume-window-into-column = [];};
    "Mod+Period" = {expel-window-from-column = [];};

    # ── Sizing ────────────────────────────────────────────────────────────────
    "Mod+R"       = {switch-preset-column-width = [];};
    "Mod+Shift+R" = {switch-preset-window-height = [];};
    "Mod+Ctrl+R"  = {reset-window-height = [];};
    "Mod+Minus"       = {set-column-width = "-10%";};
    "Mod+Equal"       = {set-column-width = "+10%";};
    "Mod+Shift+Minus" = {set-window-height = "-10%";};
    "Mod+Shift+Equal" = {set-window-height = "+10%";};

    # ── Window states ─────────────────────────────────────────────────────────
    "Mod+F"       = {maximize-column = [];};
    "Mod+Shift+F" = {fullscreen-window = [];};
    "Mod+Ctrl+F"  = {expand-column-to-available-width = [];};

    # ── Centering ─────────────────────────────────────────────────────────────
    "Mod+C"      = {center-column = [];};
    "Mod+Ctrl+C" = {center-visible-columns = [];};

    # ── Floating ──────────────────────────────────────────────────────────────
    "Mod+V"       = {toggle-window-floating = [];};
    "Mod+Shift+V" = {switch-focus-between-floating-and-tiling = [];};
  };
}
