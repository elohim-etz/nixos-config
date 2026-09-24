{ themeColors, ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "desktop-theme";

      theme_background = true;

      truecolor = true;

      force_tty = false;

      terminal_sync = true;

      rounded_corners = true;

      vim_keys = true;

      disable_mouse = false;

      # High-resolution graphs.
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";

      shown_boxes = "cpu mem net proc";

      update_ms = 1000;

      presets =
        "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";

      proc_sorting = "cpu direct";

      proc_reversed = true;

      proc_tree = false;

      proc_aggregate = true;

      cpu_graph_upper = "total";

      show_cpu_freq = true;

      mem_graphs = true;

      net_download = 100;

      net_upload = 100;
    };

    themes = {
      desktop-theme = ''
        # Main background, empty for terminal default.
        theme[main_bg]="${themeColors.base}"

        # Main text color.
        theme[main_fg]="${themeColors.text}"

        # Title color for boxes.
        theme[title]="${themeColors.text}"

        # Highlight color for keyboard shortcuts.
        theme[hi_fg]="${themeColors.blue}"

        # Background color of selected item in processes box.
        theme[selected_bg]="${themeColors.surface1}"

        # Foreground color of selected item in processes box.
        theme[selected_fg]="${themeColors.blue}"

        # Color of inactive/disabled text.
        theme[inactive_fg]="${themeColors.overlay1}"

        # Color of text appearing on top of graphs.
        theme[graph_text]="${themeColors.rosewater}"

        # Background color of percentage meters.
        theme[meter_bg]="${themeColors.surface1}"

        # Misc colors for processes box, mini CPU graphs,
        # memory graph and details status text.
        theme[proc_misc]="${themeColors.rosewater}"

        # CPU, Memory, Network and Process box outline colors.
        theme[cpu_box]="${themeColors.mauve}"
        theme[mem_box]="${themeColors.green}"
        theme[net_box]="${themeColors.maroon}"
        theme[proc_box]="${themeColors.blue}"

        # Box divider line and small boxes line color.
        theme[div_line]="${themeColors.overlay0}"

        # Temperature graph: Green -> Yellow -> Red.
        theme[temp_start]="${themeColors.green}"
        theme[temp_mid]="${themeColors.yellow}"
        theme[temp_end]="${themeColors.red}"

        # CPU graph: Teal -> Sky -> Lavender.
        theme[cpu_start]="${themeColors.teal}"
        theme[cpu_mid]="${themeColors.sky}"
        theme[cpu_end]="${themeColors.lavender}"

        # Memory/Disk free meter: Mauve -> Lavender -> Blue.
        theme[free_start]="${themeColors.mauve}"
        theme[free_mid]="${themeColors.lavender}"
        theme[free_end]="${themeColors.blue}"

        # Memory/Disk cached meter: Sapphire -> Blue -> Lavender.
        theme[cached_start]="${themeColors.sapphire}"
        theme[cached_mid]="${themeColors.blue}"
        theme[cached_end]="${themeColors.lavender}"

        # Memory/Disk available meter: Peach -> Maroon -> Red.
        theme[available_start]="${themeColors.peach}"
        theme[available_mid]="${themeColors.maroon}"
        theme[available_end]="${themeColors.red}"

        # Memory/Disk used meter: Green -> Teal -> Sky.
        theme[used_start]="${themeColors.green}"
        theme[used_mid]="${themeColors.teal}"
        theme[used_end]="${themeColors.sky}"

        # Download graph: Peach -> Maroon -> Red.
        theme[download_start]="${themeColors.peach}"
        theme[download_mid]="${themeColors.maroon}"
        theme[download_end]="${themeColors.red}"

        # Upload graph: Green -> Teal -> Sky.
        theme[upload_start]="${themeColors.green}"
        theme[upload_mid]="${themeColors.teal}"
        theme[upload_end]="${themeColors.sky}"

        # Process box gradient: Sapphire -> Lavender -> Mauve.
        theme[process_start]="${themeColors.sapphire}"
        theme[process_mid]="${themeColors.lavender}"
        theme[process_end]="${themeColors.mauve}"
      '';
    };
  };
}
