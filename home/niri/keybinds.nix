{
  config,
  pkgs,
  ...
}:

let
  apps = import ./applications.nix { inherit pkgs; };

in
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      pactl = "${pkgs.pulseaudio}/bin/pactl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";

      volume-up = spawn pactl [
        "set-sink-volume"
        "@DEFAULT_SINK@"
        "+5%"
      ];
      volume-down = spawn pactl [
        "set-sink-volume"
        "@DEFAULT_SINK@"
        "-5%"
      ];
      volume-mute = spawn pactl [
        "set-sink-mute"
        "@DEFAULT_SINK@"
        "toggle"
      ];
      media-play-pause = spawn playerctl [ "play-pause" ];
      media-next = spawn playerctl [ "next" ];
      media-previous = spawn playerctl [ "previous" ];
    in
    {

      # Quickshell Keybinds Start
      "super+a".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];

      "ctrl+alt+delete".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "sessionMenu"
        "toggle"
      ];

      "super+shift+w".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "wallpaper"
        "toggle"
      ];
      # Quickshell Keybinds End

    # -------------------- Launchers --------------------
    "Mod+T" = { action.spawn = "kitty"; };
    "Mod+E" = { action.spawn = "nemo"; };

    # -------------------- System --------------------
    "Mod+Alt+L" = { action.spawn = "hyprlock"; };
 #   "Ctrl+Alt+Delete" = {
 #     action.spawn = [ "wlogout" "--buttons-per-row" "2" ];
 #   };

    "Mod+Shift+E" = { action.quit = { }; };
    "Mod+Shift+P" = { action.power-off-monitors = { }; };

    "Mod+Escape" = {
      allow-inhibiting = false;
      action.toggle-keyboard-shortcuts-inhibit = { };
    };

    # -------------------- Audio --------------------
    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
    };

    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
    };

    "XF86AudioMute" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };

    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };

    # Fallback
    "F2" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
    };

    "F3" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
    };

    "F4" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };

    "Alt+F4" = {
      allow-when-locked = true;
      action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };

    # -------------------- Media --------------------
    "XF86AudioPlay" = { allow-when-locked = true; action.spawn-sh = "playerctl play-pause"; };
    "XF86AudioStop" = { allow-when-locked = true; action.spawn-sh = "playerctl stop"; };
    "XF86AudioPrev" = { allow-when-locked = true; action.spawn-sh = "playerctl previous"; };
    "XF86AudioNext" = { allow-when-locked = true; action.spawn-sh = "playerctl next"; };

    "F1" = { allow-when-locked = true; action.spawn-sh = "playerctl play-pause"; };
    "F5" = { allow-when-locked = true; action.spawn-sh = "playerctl previous"; };
    "F6" = { allow-when-locked = true; action.spawn-sh = "playerctl next"; };

    # -------------------- Brightness --------------------
    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
    };

    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action.spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];
    };

    "F11" = {
      allow-when-locked = true;
      action.spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];
    };

    "F12" = {
      allow-when-locked = true;
      action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
    };

    # -------------------- Screenshots --------------------
    "Mod+P" = { action.spawn-sh = "grim -g \"$(slurp)\" - | satty -f -"; };
    "Print" = { action.screenshot = { }; };
    "Ctrl+Print" = { action.screenshot-screen = { }; };
    "Alt+Print" = { action.screenshot-window = { }; };

    # -------------------- Window Management --------------------
    "Mod+Return" = { repeat = false; action.toggle-overview = { }; };
    "Mod+Q"      = { repeat = false; action.close-window = { }; };

    "Mod+Left"  = { action.focus-column-left = { }; };
    "Mod+Right" = { action.focus-column-right = { }; };
    "Mod+Down"  = { action.focus-workspace-down = { }; };
    "Mod+Up"    = { action.focus-workspace-up = { }; };

    "Mod+H" = { action.focus-column-left = { }; };
    "Mod+L" = { action.focus-column-right = { }; };

    "Mod+Home" = { action.focus-column-first = { }; };
    "Mod+End"  = { action.focus-column-last = { }; };

    # Mouse wheel workspace switching
    "Mod+WheelScrollDown" = {
      cooldown-ms = 150;
      action.focus-workspace-down = { };
    };
    
    "Mod+WheelScrollUp" = {
      cooldown-ms = 150;
      action.focus-workspace-up = { };
    };
    
    "Mod+Ctrl+WheelScrollDown" = {
      cooldown-ms = 150;
      action.move-column-to-workspace-down = { };
    };
    
    "Mod+Ctrl+WheelScrollUp" = {
      cooldown-ms = 150;
      action.move-column-to-workspace-up = { };
    };
    
    # Horizontal scrolling for columns
    "Mod+WheelScrollRight" = {
      action.focus-column-right = { };
    };
    
    "Mod+WheelScrollLeft" = {
      action.focus-column-left = { };
    };
    
    "Mod+Ctrl+WheelScrollRight" = {
      action.move-column-right = { };
    };
    
    "Mod+Ctrl+WheelScrollLeft" = {
      action.move-column-left = { };
    };
    
    # Alternative horizontal scrolling (shift + wheel)
    "Mod+Shift+WheelScrollDown" = {
      action.focus-column-right = { };
    };
    
    "Mod+Shift+WheelScrollUp" = {
      action.focus-column-left = { };
    };
    
    "Mod+Ctrl+Shift+WheelScrollDown" = {
      action.move-column-right = { };
    };
    
    "Mod+Ctrl+Shift+WheelScrollUp" = {
      action.move-column-left = { };
    };


    # -------------------- Move Windows --------------------
    "Mod+Ctrl+Left"  = { action.move-column-left = { }; };
    "Mod+Ctrl+Right" = { action.move-column-right = { }; };
    "Mod+Ctrl+Down"  = { action.move-window-down = { }; };
    "Mod+Ctrl+Up"    = { action.move-window-up = { }; };

    "Mod+Ctrl+H" = { action.move-column-left = { }; };
    "Mod+Ctrl+L" = { action.move-column-right = { }; };
    "Mod+Ctrl+J" = { action.move-window-down = { }; };
    "Mod+Ctrl+K" = { action.move-window-up = { }; };

    "Mod+Ctrl+Home" = { action.move-column-to-first = { }; };
    "Mod+Ctrl+End"  = { action.move-column-to-last = { }; };

    # -------------------- Workspaces (numbers) --------------------
    "Mod+1" = { action.focus-workspace = 1; };
    "Mod+2" = { action.focus-workspace = 2; };
    "Mod+3" = { action.focus-workspace = 3; };
    "Mod+4" = { action.focus-workspace = 4; };
    "Mod+5" = { action.focus-workspace = 5; };
    "Mod+6" = { action.focus-workspace = 6; };
    "Mod+7" = { action.focus-workspace = 7; };
    "Mod+8" = { action.focus-workspace = 8; };
    "Mod+9" = { action.focus-workspace = 9; };

    "Mod+Shift+1" = { action.move-column-to-workspace = 1; };
    "Mod+Shift+2" = { action.move-column-to-workspace = 2; };
    "Mod+Shift+3" = { action.move-column-to-workspace = 3; };
    "Mod+Shift+4" = { action.move-column-to-workspace = 4; };
    "Mod+Shift+5" = { action.move-column-to-workspace = 5; };
    "Mod+Shift+6" = { action.move-column-to-workspace = 6; };
    "Mod+Shift+7" = { action.move-column-to-workspace = 7; };
    "Mod+Shift+8" = { action.move-column-to-workspace = 8; };
    "Mod+Shift+9" = { action.move-column-to-workspace = 9; };

    # -------------------- Column Ops --------------------
    "Mod+BracketLeft"  = { action.consume-or-expel-window-left = { }; };
    "Mod+BracketRight" = { action.consume-or-expel-window-right = { }; };
    "Mod+Comma"        = { action.consume-window-into-column = { }; };
    "Mod+Period"       = { action.expel-window-from-column = { }; };

    # -------------------- Sizing --------------------
    "Mod+R"       = { action.switch-preset-column-width = { }; };
    "Mod+Shift+R" = { action.switch-preset-window-height = { }; };
    "Mod+Ctrl+R"  = { action.reset-window-height = { }; };

    "Mod+Minus" = { action.set-column-width = "-10%"; };
    "Mod+Equal" = { action.set-column-width = "+10%"; };

    "Mod+Shift+Minus" = { action.set-window-height = "-10%"; };
    "Mod+Shift+Equal" = { action.set-window-height = "+10%"; };

    # -------------------- States --------------------
    "Mod+F"       = { action.maximize-column = { }; };
    "Mod+Shift+F" = { action.fullscreen-window = { }; };
    "Mod+Ctrl+F"  = { action.expand-column-to-available-width = { }; };

    # -------------------- Centering --------------------
    "Mod+C"      = { action.center-column = { }; };
    "Mod+Ctrl+C" = { action.center-visible-columns = { }; };

    # -------------------- Floating --------------------
    "Mod+V"       = { action.toggle-window-floating = { }; };
    "Mod+Shift+V" = { action.switch-focus-between-floating-and-tiling = { }; };
    };
}
