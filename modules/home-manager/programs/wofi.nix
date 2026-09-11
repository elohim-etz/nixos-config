{themeColors, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      width = "30%";
      height = "50%";
      location = "center";
      show = "drun";
      prompt = "Search...";
      hide_scroll = true;
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 32;
      gtk_dark = true;
      dynamic_lines = false;
    };

    style = ''
      @define-color base ${themeColors.base};
      @define-color surface0 ${themeColors.surface0};
      @define-color surface1 ${themeColors.surface1};
      @define-color surface2 ${themeColors.surface2};
      @define-color text ${themeColors.text};
      @define-color lavender ${themeColors.lavender};
      @define-color mauve ${themeColors.mauve};
      @define-color red ${themeColors.red};
      @define-color overlay0 ${themeColors.overlay0};

      @define-color bg-opacity ${themeColors.base};
      @define-color input-bg ${themeColors.surface0};
      @define-color input-focus-bg ${themeColors.surface1};
      @define-color entry-selected ${themeColors.mauve};
      @define-color entry-hover ${themeColors.surface0};

      * {
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 18px;
        border: none;
        box-shadow: none;
        outline: none;
      }

      window,
      decoration {
        background-color: transparent;
        border-radius: 14px;
        box-shadow: none;
        margin: 0;
      }

      #outer-box {
        background-color: @bg-opacity;
        border: 2px solid @mauve;
        border-radius: 14px;
        margin: 0px;
        padding: 15px;
      }

      #input {
        background-color: @input-bg;
        color: @text;
        padding: 10px 15px;
        margin-bottom: 10px;
        border-radius: 14px;
        outline: none;
        transition: all 0.2s ease;
      }

      #input:focus {
        background-color: @input-focus-bg;
        box-shadow: 0 0 0 2px @mauve;
      }

      #scroll {
        margin-top: 5px;
      }

      #entry {
        padding: 10px 15px;
        margin: 2px 0;
        border-radius: 14px;
        color: @text;
        background-color: transparent;
        transition: all 0.2s ease;
      }

      #entry:selected {
        background-color: @entry-selected;
        color: @base;
      }

      #entry:hover:not(:selected) {
        background-color: @entry-hover;
      }

      #text {
        padding: 0px 5px;
      }

      #text:selected {
        color: @base;
        font-weight: 600;
      }

      scrollbar slider {
        background-color: @mauve;
        border-radius: 8px;
        min-height: 40px;
      }
    '';
  };

  xdg.configFile."wofi/wallpaper-picker.conf".text = ''
    width=1000
    height=660
    location=center
    show=dmenu
    prompt=  Select Wallpaper
    layer=overlay
    columns=3
    image_size=300
    allow_images=true
    insensitive=true
    hide_scroll=true
    sort_order=default
    cache_file=/dev/null
    lines=3
    orientation=vertical
    content_halign=fill
    halign=fill
  '';

  xdg.configFile."wofi/wallpaper-picker.css".text = ''
    * {
      box-shadow: none;
      outline: none;
    }

    window,
    decoration {
      background-color: transparent;
      border-radius: 14px;
      box-shadow: none;
      margin: 0;
    }

    #outer-box {
      margin: 0px;
      padding: 12px;
      background-color: ${themeColors.base};
      border-radius: 14px;
      border: 2px solid ${themeColors.mauve};
    }

    #inner-box {
      margin: 0px;
      background-color: transparent;
    }

    #input {
      margin: 0px 0px 10px 0px;
      padding: 9px 14px;
      border-radius: 10px;
      border: 1.5px solid ${themeColors.surface1};
      background-color: #313244;
      color: ${themeColors.text};
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
      caret-color: ${themeColors.mauve};
    }

    #input:focus {
      border-color: ${themeColors.mauve};
      background-color: ${themeColors.surface1};
    }

    #scroll {
      margin: 0px;
    }

    #entry {
      padding: 5px;
      margin: 4px;
      border-radius: 10px;
      border: 2px solid transparent;
      background-color: ${themeColors.mantle};
      min-width: 300px;
      max-width: 300px;
    }

    #entry:selected {
      border-color: ${themeColors.mauve};
      background-color: rgba(${themeColors.mauveRgb}, 0.12);
    }

    #entry:hover {
      border-color: ${themeColors.blue};
      background-color: ${themeColors.base};
    }

    #img {
      min-width: 290px;
      max-width: 290px;
      min-height: 163px;
      max-height: 163px;
      border-radius: 7px;
      margin: 0px;
      padding: 0px;
    }

    #text {
      color: ${themeColors.subtext1};
      font-family: "JetBrainsMono Nerd Font";
      font-size: 10px;
      margin: 4px 2px 0px 2px;
      padding: 0px;
    }

    #text:selected {
      color: ${themeColors.mauve};
      font-weight: bold;
    }

    scrollbar slider {
      background-color: ${themeColors.mauve};
      border-radius: 6px;
      min-width: 5px;
    }
  '';
}
