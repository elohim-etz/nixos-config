{ config, lib, pkgs, ... }:

{
  programs.niri.config = lib.mkAfter {
    window-rules = [
      {
        matches = [ { app-id = "waybar"; } ];
        effects.blur = {
          radius = 30;
          noise = 0.05;
          brightness = 1.0;
          contrast = 1.0;
        };
      }
      {
        matches = [ { app-id = "kitty"; } ];
        effects.blur = {
          radius = 20;
          noise = 0.05;
          brightness = 1.0;
          contrast = 1.0;
        };
      }
      {
        matches = [ { app-id = "^org\\.gnome\\.Nautilus$"; } ];
        effects.blur = {
          radius = 25;
          noise = 0.05;
          brightness = 1.0;
          contrast = 1.0;
        };
      }
      {
        matches = [ { app-id = "wofi"; } ];
        effects.blur = {
          radius = 25;
          noise = 0.05;
          brightness = 1.0;
          contrast = 1.0;
        };
      }
    ];
  };
}
