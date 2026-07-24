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
}
