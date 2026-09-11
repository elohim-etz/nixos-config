{
  pkgs,
  themeColors,
  ...
}: {
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

    * {
      background-image: none;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
    }

    window {
      background-color: alpha(${themeColors.base}, 0.30);
    }

    button {
      color: ${themeColors.text};
      background-color: ${themeColors.surface0};
      border: 2px solid ${themeColors.surface1};
      border-radius: 25px;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
      margin: 5px;
      transition: all 0.2s ease;
    }

    button:focus {
      background-color: ${themeColors.surface1};
    }

    #lock:hover,
    #lock:focus { border: 2px solid alpha(${themeColors.blue}, 0.9); }

    #logout:hover,
    #logout:focus { border: 2px solid alpha(${themeColors.yellow}, 0.9); }

    #suspend:hover,
    #suspend:focus { border: 2px solid alpha(${themeColors.teal}, 0.9); }

    #hibernate:hover,
    #hibernate:focus { border: 2px solid alpha(${themeColors.mauve}, 0.9); }

    #shutdown:hover,
    #shutdown:focus { border: 2px solid alpha(${themeColors.red}, 0.9); }

    #reboot:hover,
    #reboot:focus { border: 2px solid alpha(${themeColors.peach}, 0.9); }

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
