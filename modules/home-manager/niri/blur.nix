{ pkgs, ... }: {
  # Blur settings for niri layer rules
  programs.niri.settings.layer-rules = [
    # Wofi blur
    {
      matches = [{ namespace = "^wofi$"; }];
      block-out-from = "screen-capture";
    }
    # Waybar blur
    {
      matches = [{ namespace = "^waybar$"; }];
      block-out-from = "screen-capture";
    }
    # Wlogout blur
    {
      matches = [{ namespace = "^wlogout$"; }];
      block-out-from = "screen-capture";
    }
  ];

  # Window rules for applications with blur
  programs.niri.settings.window-rules = [
    # Kitty blur
    {
      matches = [{ app-id = "kitty"; }];
      block-out-from = "screen-capture";
    }
    # Nautilus blur
    {
      matches = [{ app-id = "^org\\.gnome\\.Nautilus$"; }];
      block-out-from = "screen-capture";
    }
  ];

  # Add CSS for application-specific blur effects
  # Wofi - add backdrop-filter blur
  xdg.configFile."wofi/style.css".text = ''
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
    @define-color input-bg rgba(49, 50, 68, 0.85);
    @define-color input-focus-bg rgba(69, 71, 90, 0.85);
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
      backdrop-filter: blur(10px);
      -gtk-backdrop-filter: blur(10px);
      border: 2px solid @mauve;
      border-radius: 14px;
      margin: 10px;
      padding: 15px;
    }

    #input {
      background-color: @input-bg;
      backdrop-filter: blur(5px);
      -gtk-backdrop-filter: blur(5px);
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

  # Waybar - add blur effect
  xdg.configFile."waybar/style.css".text = ''
    * {
      border: none;
      border-radius: 0;
      font-family: "JetBrainsMono Nerd Font";
      font-weight: 600;
      font-size: 13px;
      min-height: 0;
      border-radius: 8px;
    }

    window#waybar {
      background: transparent;
    }

    window#waybar > box {
      background-color: rgba(24, 24, 37, 0.85);
      backdrop-filter: blur(10px);
      -gtk-backdrop-filter: blur(10px);
      border-radius: 8px;
      margin: 2px;
    }

    tooltip {
      background: rgba(48, 45, 65, 0.9);
      border-radius: 8px;
      backdrop-filter: blur(10px);
      -gtk-backdrop-filter: blur(10px);
    }

    tooltip label {
      color: rgb(217, 224, 238);
    }

    /* Left side modules */
    #custom-launcher {
      background-color: transparent;
      color: #cdd6f4;
      padding: 0 15px;
      margin: 1px 0 1px 5px;
      border-radius: 8px;
    }

    #memory,
    #temperature,
    #cpu {
      background-color: transparent;
      color: #cdd6f4;
      margin: 1px 0;
    }

    #memory {
      border-radius: 8px 0 0 8px;
      margin-left: 8px;
      padding: 0 6px 0 12px
    }

    #cpu {
      border-radius: 0 8px 8px 0;
      margin-right: 0;
      padding: 0 12px 0 6px
    }

    #temperature {
      border-radius: 0;
      margin-left: 0;
      margin-right: 0;
      padding: 0 6px 0 6px
    }

    #clock {
      background-color: transparent;
      color: #cdd6f4;
      padding: 0 15px;
      margin: 1px 0 1px 8px;
      border-radius: 8px;
    }

    #mpris {
      background-color: transparent;
      color: #a6e3a1;
      padding: 0 15px;
      margin: 1px 8px;
      border-radius: 8px;
    }

    /* Center - workspaces */
    #workspaces {
      background-color: transparent;
      border-radius: 8px;
      padding: 1px 6px;
      margin: 1px 4px;
    }
    #workspaces button {
      padding: 0 2px;
      margin: 0;
      min-width: 21px;
      min-height: 21px;
      border: none;
      border-radius: 8px;
      background-color: transparent;
      color: #6c7086;
      transition: background-color 0.15s ease;
    }
    #workspaces button.active {
      color: #cdd6f4;
      border-radius: 8px;
      background-color: rgba(203, 166, 247, 0.25);
    }
    #workspaces button.urgent {
      background-color: rgba(243, 139, 168, 0.2);
      color: #f38ba8;
    }

    /* Right side modules */
    #network {
      background-color: transparent;
      color: #cdd6f4;
      padding: 0 12px;
      margin: 1px 0 1px 8px;
      border-radius: 8px;
    }

    #pulseaudio,
    #backlight {
      background-color: transparent;
      color: #cdd6f4;
      margin: 1px 0;
    }

    #pulseaudio {
      border-radius: 8px 0 0 8px;
      margin-left: 8px;
      margin-right: 0;
      padding: 0 6px 0 12px
    }

    #backlight {
      border-radius: 0 8px 8px 0;
      margin-left: 0;
      padding: 0 12px 0 6px
    }

    #tray {
      background-color: transparent;
      padding: 0 10px;
      margin: 1px 0 1px 8px;
      border-radius: 8px;
    }

    #power-profiles-daemon,
    #battery,
    #custom-power {
      background-color: transparent;
      color: #cdd6f4;
      margin: 1px 0;
    }

    #power-profiles-daemon {
      border-radius: 8px 0 0 8px;
      margin-left: 8px;
      padding: 0 6px 0 12px
    }

    #battery {
      border-radius: 0;
      margin-left: 0;
      margin-right: 0;
      padding: 0 6px 0 6px
    }

    #custom-power {
      border-radius: 0 8px 8px 0;
      margin-right: 5px;
      padding: 0 12px 0 6px
    }

    #battery.charging {
      color: #a6e3a1;
    }

    #battery.warning:not(.charging) {
      color: #f9e2af;
    }

    #battery.critical:not(.charging) {
      color: #f38ba8;
      animation: blink 0.5s linear infinite alternate;
    }

    @keyframes blink {
      to {
        opacity: 0.5;
      }
    }

    #temperature.critical {
      color: #f38ba8;
    }

    /* Module-specific colors */
    #memory {
      color: #89dceb;
    }

    #temperature {
      color: #f9e2af;
    }

    #cpu {
      color: #a6e3a1;
    }

    #power-profiles-daemon {
      color: #f5c2e7;
    }

    #network {
      color: #89b4fa;
    }

    #pulseaudio {
      color: #cba6f7;
    }

    #backlight {
      color: #f9e2af;
    }
  '';

  # Wlogout - add blur effect
  xdg.configFile."wlogout/style.css".text = ''
    * {
      background-image: none;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
    }

    window {
      background-color: rgba(30, 30, 46, 0.85);
      backdrop-filter: blur(15px);
      -gtk-backdrop-filter: blur(15px);
    }

    button {
      color: #cdd6f4;
      background-color: rgba(49, 50, 68, 0.7);
      backdrop-filter: blur(5px);
      -gtk-backdrop-filter: blur(5px);
      border-radius: 12px;
      border: 2px solid rgba(137, 180, 250, 0.3);
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
      margin: 20px;
      transition: all 0.3s ease;
    }

    button:hover {
      background-color: rgba(137, 180, 250, 0.2);
      border: 2px solid #89b4fa;
      color: #89b4fa;
    }

    button:focus {
      background-color: rgba(137, 180, 250, 0.3);
      border: 2px solid #89b4fa;
      color: #cdd6f4;
    }

    #lock {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
    }

    #lock:hover {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
    }

    #logout {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
    }

    #logout:hover {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
    }

    #suspend {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
    }

    #suspend:hover {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
    }

    #hibernate {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
    }

    #hibernate:hover {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
    }

    #shutdown {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
    }

    #shutdown:hover {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
    }

    #reboot {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
    }

    #reboot:hover {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
    }
  '';

  # Kitty - configure blur via kitty.conf
  programs.kitty.settings.background_opacity = "0.85";
  programs.kitty.settings.dynamic_background_opacity = true;
}
