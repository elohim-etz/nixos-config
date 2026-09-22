{ lib, ... }:
let
  on = keys: action: lib.genAttrs keys (_: action);

  withProps = props: action: { _props = props; } // action;
  locked = withProps { allow-when-locked = true; };
  noRepeat = withProps { repeat = false; };
  throttled = withProps { cooldown-ms = 150; };

  # ── commands ─────────────────────────────────────────────────────────
  cmd = {
    sinkMute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    micMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    volumeUp = step: "wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}+ -l 1.0";
    volumeDown = step: "wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}-";
    phoneKey = code: "adb shell input keyevent ${toString code}";
  };
  brightness = delta: [
    "brightnessctl"
    "--class=backlight"
    "set"
    delta
  ];

  # ── groups ───────────────────────────────────────────────────────────
  apps = {
    "Mod+T".spawn = [ "kitty" ];
    "Mod+E".spawn = [ "nautilus" ];
    "Mod+A".spawn = [
      "sh"
      "-c"
      "pkill rofi || rofi -show drun"
    ];
    "Mod+Shift+W".spawn = [ "wallpaper-picker" ];
    "Ctrl+Alt+Delete".spawn = [ "wlogout" ];
  };

  screenshots = {
    "Print".screenshot = { };
    "Ctrl+Print".screenshot-screen = { };
    "Alt+Print".screenshot-window = { };
    "Mod+P".spawn-sh = ''grim -g "$(slurp)" - | satty -f -'';
  };

  session = {
    "Mod+Q" = noRepeat { close-window = { }; };
    "Mod+Return" = noRepeat { toggle-overview = { }; };
    # Escape hatch for apps that grab all keys (VMs, remote desktops).
    "Mod+Escape" = withProps { allow-inhibiting = false; } {
      toggle-keyboard-shortcuts-inhibit = { };
    };
    "Mod+Shift+E".quit = { };
    "Mod+Shift+P".power-off-monitors = { };
  };

  # Move focus (vim keys + arrows).
  focus = lib.mergeAttrsList [
    (on [ "Mod+H" "Mod+Left" ] { focus-column-left = { }; })
    (on [ "Mod+L" "Mod+Right" ] { focus-column-right = { }; })
    {
      "Mod+J".focus-window-or-workspace-down = { };
      "Mod+K".focus-window-or-workspace-up = { };
      "Mod+Down".focus-workspace-down = { };
      "Mod+Up".focus-workspace-up = { };
      "Mod+Home".focus-column-first = { };
      "Mod+End".focus-column-last = { };
    }
  ];

  # Move columns / windows (Ctrl + the focus keys).
  move = lib.mergeAttrsList [
    (on [ "Mod+Ctrl+H" "Mod+Ctrl+Left" ] { move-column-left = { }; })
    (on [ "Mod+Ctrl+L" "Mod+Ctrl+Right" ] { move-column-right = { }; })
    (on [ "Mod+Ctrl+J" "Mod+Ctrl+Down" ] { move-window-down = { }; })
    (on [ "Mod+Ctrl+K" "Mod+Ctrl+Up" ] { move-window-up = { }; })
    {
      "Mod+Ctrl+Home".move-column-to-first = { };
      "Mod+Ctrl+End".move-column-to-last = { };
    }
  ];

  # Column / window shape and mode.
  windows = {
    "Mod+BracketLeft".consume-or-expel-window-left = { };
    "Mod+BracketRight".consume-or-expel-window-right = { };
    "Mod+Comma".consume-window-into-column = { };
    "Mod+Period".expel-window-from-column = { };

    "Mod+C".center-column = { };
    "Mod+Ctrl+C".center-visible-columns = { };
    "Mod+F".maximize-column = { };
    "Mod+Ctrl+F".expand-column-to-available-width = { };
    "Mod+Shift+F".fullscreen-window = { };
    "Mod+V".toggle-window-floating = { };
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };

    "Mod+R".switch-preset-column-width = { };
    "Mod+Shift+R".switch-preset-window-height = { };
    "Mod+Ctrl+R".reset-window-height = { };
    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";
    "Mod+Shift+Equal".set-window-height = "+10%";
  };

  # Mod+1..9 focus a workspace, Mod+Shift+1..9 send the column there.
  workspaces = lib.mergeAttrsList (
    map (n: {
      "Mod+${toString n}".focus-workspace = n;
      "Mod+Shift+${toString n}".move-column-to-workspace = n;
    }) (lib.range 1 9)
  );

  # Mouse wheel: workspaces / columns.
  wheel = {
    "Mod+WheelScrollDown" = throttled { focus-workspace-down = { }; };
    "Mod+WheelScrollUp" = throttled { focus-workspace-up = { }; };
    "Mod+WheelScrollLeft".focus-column-left = { };
    "Mod+WheelScrollRight".focus-column-right = { };
    "Mod+Shift+WheelScrollDown".focus-column-right = { };
    "Mod+Shift+WheelScrollUp".focus-column-left = { };

    "Mod+Ctrl+WheelScrollDown" = throttled { move-column-to-workspace-down = { }; };
    "Mod+Ctrl+WheelScrollUp" = throttled { move-column-to-workspace-up = { }; };
    "Mod+Ctrl+WheelScrollLeft".move-column-left = { };
    "Mod+Ctrl+WheelScrollRight".move-column-right = { };
    "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = { };
    "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = { };
  };

  media = lib.mergeAttrsList (
    map (b: on b.keys (locked b.action)) [
      {
        keys = [ "XF86AudioPlay" "Shift+F1" ];
        action.spawn-sh = "playerctl play-pause";
      }
      {
        keys = [ "XF86AudioPrev" "Shift+F5" ];
        action.spawn-sh = "playerctl previous";
      }
      {
        keys = [ "XF86AudioNext" "Shift+F6" ];
        action.spawn-sh = "playerctl next";
      }
      {
        keys = [ "XF86AudioStop" ];
        action.spawn-sh = "playerctl stop";
      }
      {
        keys = [ "XF86AudioMute" "Shift+F4" ];
        action.spawn-sh = cmd.sinkMute;
      }
      {
        keys = [ "XF86AudioMicMute" "Alt+F4" ];
        action.spawn-sh = cmd.micMute;
      }
      {
        keys = [ "XF86AudioRaiseVolume" ];
        action.spawn-sh = cmd.volumeUp "0.1";
      }
      {
        keys = [ "XF86AudioLowerVolume" ];
        action.spawn-sh = cmd.volumeDown "0.1";
      }
      # Fine-grained steps on the F-row.
      {
        keys = [ "Shift+F3" ];
        action.spawn-sh = cmd.volumeUp "0.05";
      }
      {
        keys = [ "Shift+F2" ];
        action.spawn-sh = cmd.volumeDown "0.05";
      }
      {
        keys = [ "XF86MonBrightnessUp" "Shift+F12" ];
        action.spawn = brightness "+10%";
      }
      {
        keys = [ "XF86MonBrightnessDown" "Shift+F11" ];
        action.spawn = brightness "10%-";
      }
    ]
  );

  # Alt+F1..F6: control the paired Android phone's media keys over adb.
  # (Alt+F4 is the mic-mute key in `media` above.)
  phone = lib.mapAttrs (_: code: locked { spawn-sh = cmd.phoneKey code; }) {
    "Alt+F1" = 85; # play/pause
    "Alt+F2" = 25; # volume down
    "Alt+F3" = 24; # volume up
    "Alt+F5" = 88; # previous
    "Alt+F6" = 87; # next
  };
in
{
  wayland.windowManager.niri.settings.binds = lib.mergeAttrsList [
    apps
    screenshots
    session
    focus
    move
    windows
    workspaces
    wheel
    media
    phone
  ];
}
