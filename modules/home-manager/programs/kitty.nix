{themeColors, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 11.0;
      background_opacity = "0.90";
      dynamic_background_opacity = true;

      confirm_os_window_close = -1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

      window_padding_width = 10;

      modify_font_underline_position = -2;

      term = "xterm-256color";

      enable_audio_bell = "no";

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      foreground = themeColors.text;
      background = themeColors.base;
      selection_foreground = themeColors.base;
      selection_background = themeColors.rosewater;

      cursor = themeColors.rosewater;
      cursor_text_color = themeColors.base;

      url_color = themeColors.rosewater;

      active_border_color = themeColors.lavender;
      inactive_border_color = themeColors.overlay0;
      bell_border_color = themeColors.yellow;

      active_tab_foreground = themeColors.crust;
      active_tab_background = themeColors.mauve;
      inactive_tab_foreground = themeColors.text;
      inactive_tab_background = themeColors.mantle;
      tab_bar_background = themeColors.crust;

      mark1_foreground = themeColors.base;
      mark1_background = themeColors.lavender;
      mark2_foreground = themeColors.base;
      mark2_background = themeColors.mauve;
      mark3_foreground = themeColors.base;
      mark3_background = themeColors.sapphire;

      color0 = themeColors.surface1;
      color8 = themeColors.surface2;
      color1 = themeColors.red;
      color9 = themeColors.red;
      color2 = themeColors.green;
      color10 = themeColors.green;
      color3 = themeColors.yellow;
      color11 = themeColors.yellow;
      color4 = themeColors.blue;
      color12 = themeColors.blue;
      color5 = themeColors.pink;
      color13 = themeColors.pink;
      color6 = themeColors.teal;
      color14 = themeColors.teal;
      color7 = themeColors.subtext1;
      color15 = themeColors.subtext0;
    };

    keybindings = {
      "ctrl+v" = "paste_from_clipboard";
    };
  };
}
