_: let
  base = "rgba(1e1e2eFF)";
  surface0 = "rgba(313244FF)";
  panel = "rgba(313244B3)";
  panelBorder = "rgba(cba6f74D)";
  subtext = "rgba(a6adc8FF)";
  text = "rgba(cdd6f4FF)";
  mauve = "rgba(cba6f7FF)";
  lavender = "rgba(b4befeFF)";
  red = "rgba(f38ba8FF)";
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      animations = {
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
          path = "/home/naveen/nixos-assets-tmp/walls/wall-026.png";
          color = base;
          blur_passes = 3;
        }
      ];

      shape = [
        {
          monitor = "";
          size = "4000, 4000";
          color = "rgba(00000077)";
          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = -1;
        }
        {
          monitor = "";
          size = "320, 320";
          color = panel;
          rounding = 32;
          border_size = 2;
          border_color = panelBorder;
          position = "0, -145";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 20;
          shadow_color = "rgba(00000066)";
          shadow_boost = 1.0;
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
          position = "0, -203";
          halign = "center";
          valign = "center";
          zindex = 2;
        }
      ];

      image = [
        {
          monitor = "";
          path = "/home/naveen/nixos-assets-tmp/nix-chan.png";
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
          shadow_passes = 3;
          shadow_size = 8;
          shadow_color = "rgba(00000080)";
          shadow_boost = 1.0;
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
          shadow_passes = 3;
          shadow_size = 6;
          shadow_color = "rgba(00000099)";
          shadow_boost = 1.2;
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
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(00000099)";
          shadow_boost = 1.1;
        }
        {
          monitor = "";
          text = "hi, $USER";
          color = text;
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font Mono Bold Italic";
          position = "0, -120";
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
