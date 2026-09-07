{pkgs, ...}: {
  home.packages = with pkgs; [wlogout];

  xdg.configFile."wlogout/layout".text = ''
    {
        "label" : "suspend",
        "action" : "hyprlock & disown && systemctl suspend",
        "text" : "Suspend",
        "keybind" : "u"
    }
    {
        "label" : "reboot",
        "action" : "systemctl reboot",
        "text" : "Reboot",
        "keybind" : "r"
    }
    {
        "label" : "shutdown",
        "action" : "systemctl poweroff",
        "text" : "Shutdown",
        "keybind" : "s"
    }
    {
        "label" : "lock",
        "action" : "hyprlock",
        "text" : "Lock",
        "keybind" : "l"
    }
    {
        "label" : "logout",
        "action" : "niri msg action quit",
        "text" : "Logout",
        "keybind" : "e"
    }
    {
        "label" : "hibernate",
        "action" : "systemctl hibernate",
        "text" : "Hibernate",
        "keybind" : "h"
    }
  '';

  # Wlogout styling
  xdg.configFile."wlogout/style.css".text = ''
    @define-color base     #1e1e2e;
    @define-color text     #cdd6f4;
    @define-color subtext0 #a6adc8;
    @define-color surface0 #313244;
    @define-color surface1 #45475a;
    @define-color blue     #89b4fa;
    @define-color yellow   #f9e2af;
    @define-color teal     #94e2d5;
    @define-color mauve    #cba6f7;
    @define-color red      #f38ba8;
    @define-color peach    #fab387;

    * {
      background-image: none;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
    }

    window {
      background-color: alpha(@base, 0.30);
    }

    button {
      color: @text;
      background-color: alpha(@surface0, 1.0);
      border-radius: 25px;
      border: 2px solid alpha(@surface1, 1.0);
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
      margin: 5px;
      transition: all 0.2s ease;
    }

    button:focus {
        background-color: alpha(@surface1, 1.0);
    }

    #lock:hover,
    #lock:focus { border: 2px solid alpha(@blue, 0.9); }

    #logout:hover,
    #logout:focus { border: 2px solid alpha(@yellow, 0.9); }

    #suspend:hover,
    #suspend:focus { border: 2px solid alpha(@teal, 0.9); }

    #hibernate:hover,
    #hibernate:focus { border: 2px solid alpha(@mauve, 0.9); }

    #shutdown:hover,
    #shutdown:focus { border: 2px solid alpha(@red, 0.9); }

    #reboot:hover,
    #reboot:focus { border: 2px solid alpha(@peach, 0.9); }

    #lock {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
    }
    #logout {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
    }
    #suspend {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
    }
    #hibernate {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
    }
    #shutdown {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
    }
    #reboot {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
    }
  '';
}
