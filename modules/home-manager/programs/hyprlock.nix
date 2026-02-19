{ config, lib, pkgs, ... }:

let
  base     = "rgba(1e1e2eFF)";
  surface0 = "rgba(313244FF)";
  subtext  = "rgba(a6adc8FF)";
  text     = "rgba(cdd6f4FF)";
  mauve    = "rgba(cba6f7FF)";
  lavender = "rgba(b4befeFF)";
  red      = "rgba(f38ba8FF)";
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
        hide_cursor = false;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = [
        {
          monitor = "";
          path = "$HOME/nixos-config/assets/walls/nix.png";
          color = base;
          blur_passes = 3;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      shape = [
        {
          monitor = "";
          size = "4000, 4000";
          color = "rgba(00000066)";
          rounding = 0;
          border_size = 0;
          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = 0;
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "250, 55";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = mauve;
          inner_color = surface0;
          font_color = text;
          check_color = lavender;
          fail_color = red;
          fade_on_empty = false;
          font_family = "JetBrainsMono Nerd Font Mono Italic";
          placeholder_text = "<i>enter password</i>";
          hide_input = false;
          position = "0, -153";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
      ];

      image = [
        {
          monitor = "";
          path = "$HOME/nixos-config/assets/nixos.png";
          border_color = mauve;
          border_size = 3;
          size = 160;
          rounding = -1;
          rotate = 0;
          reload_time = -1;
          position = "0, 15";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
        {
          monitor = "";
          path = "$HOME/.cache/hyprlock-art/current.jpg";
          size = 100;
          rounding = 5;
          border_size = 2;
          border_color = mauve;
          rotate = 0;
          reload_time = 2;
          reload_cmd = "$HOME/nixos-config/scripts/hyprlock-music.sh --art";
          position = "-175, 30";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = mauve;
          font_size = 100;
          font_family = "JetBrainsMono Nerd Font Mono Bold";
          position = "0, 260";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %d %B")"'';
          color = mauve;
          font_size = 30;
          font_family = "JetBrainsMono Nerd Font Mono Bold";
          position = "0, 150";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
        {
          monitor = "";
          text = "<span> </span>";
          color = mauve;
          font_size = 24;
          font_family = "JetBrainsMono Nerd Font Mono Bold";
          position = "2, -110";
          halign = "center";
          valign = "top";
          zindex = 1;
        }
        {
          monitor = "";
          text = "hi, $USER";
          color = text;
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font Mono Bold Italic";
          position = "0, -100";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
        {
          monitor = "";
          text = "$LAYOUT[us,ua,ru]";
          font_size = 14;
          color = subtext;
          font_family = "JetBrainsMono Nerd Font Mono Bold";
          onclick = "hyprctl switchxkblayout all next";
          position = "0, -206";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
      ];
    };
  };
}
