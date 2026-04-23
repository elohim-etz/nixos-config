_: {
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
      @define-color base      #1e1e2e;
      @define-color surface0  #313244;
      @define-color surface1  #45475a;
      @define-color surface2  #585b70;
      @define-color text      #cdd6f4;
      @define-color lavender  #b4befe;
      @define-color mauve     #cba6f7;
      @define-color red       #f38ba8;
      @define-color overlay0  #6c7086;

      @define-color bg-opacity rgba(30, 30, 46, 0.85);
      @define-color input-bg rgba(49, 50, 68, 0.9);
      @define-color input-focus-bg rgba(69, 71, 90, 0.9);
      @define-color entry-selected rgba(203, 166, 247, 0.9);
      @define-color entry-hover rgba(49, 50, 68, 0.7);

      * {
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 18px;
        border: none;
      }

      window {
        background-color: transparent;
      }

      #outer-box {
        background-color: @bg-opacity;
        border: 2px solid @mauve;
        border-radius: 14px;
        margin: 10px;
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
    window {
      background-color: transparent;
    }

    #outer-box {
      margin: 10px;
      padding: 12px;
      background-color: #1e1e2e;
      border-radius: 14px;
      border: 2px solid #cba6f7;
    }

    #inner-box {
      margin: 0px;
      background-color: transparent;
    }

    #input {
      margin: 0px 0px 10px 0px;
      padding: 9px 14px;
      border-radius: 10px;
      border: 1.5px solid #45475a;
      background-color: #313244;
      color: #cdd6f4;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
      caret-color: #cba6f7;
    }

    #input:focus {
      border-color: #cba6f7;
      background-color: #45475a;
    }

    #scroll {
      margin: 0px;
    }

    #entry {
      padding: 5px;
      margin: 4px;
      border-radius: 10px;
      border: 2px solid transparent;
      background-color: #181825;
      min-width: 300px;
      max-width: 300px;
    }

    #entry:selected {
      border-color: #cba6f7;
      background-color: rgba(203, 166, 247, 0.12);
    }

    #entry:hover {
      border-color: #89b4fa;
      background-color: #1e1e2e;
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
      color: #bac2de;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 10px;
      margin: 4px 2px 0px 2px;
      padding: 0px;
    }

    #text:selected {
      color: #cba6f7;
      font-weight: bold;
    }

    scrollbar slider {
      background-color: #cba6f7;
      border-radius: 6px;
      min-width: 5px;
    }
  '';
}
