{ config, pkgs, ... }:

{
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
    @define-color text      #cdd6f4;
    @define-color lavender  #b4befe;
    @define-color mauve     #cba6f7;
    @define-color red       #f38ba8;
  
    * {
      font-family: "JetBrainsMono Nerd Font", monospace;
      font-size: 18px;
      border: none;
    }
  
    window {
      background-color: transparent;
    }
  
    #outer-box {
      background-color: @base;
      border: 2px solid @mauve;
      border-radius: 14px;
      margin: 10px;
      padding: 15px;
    }
  
    #input {
      background-color: @surface0;
      color: @text;
      padding: 10px 15px;
      margin-bottom: 10px;
      border-radius: 14px;
      outline: none;
    }
  
    #input:focus {
      background-color: @surface1;
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
      background-color: @mauve;
      color: @base;
    }
  
    #entry:hover:not(:selected) {
      background-color: @surface0;
    }
  
    #text {
      padding: 0px 5px;
    }
  
    #text:selected {
      color: @base;
      font-weight: 600;
    }
  '';
  };
}
