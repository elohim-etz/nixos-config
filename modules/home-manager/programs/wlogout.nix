{pkgs, ...}: {
  home.packages = with pkgs; [wlogout];

  xdg.configFile."wlogout/layout".text = ''
    {
        "label" : "lock",
        "action" : "hyprlock",
        "text" : "Lock",
        "keybind" : "l"
    }
    {
        "label" : "hibernate",
        "action" : "systemctl hibernate",
        "text" : "Hibernate",
        "keybind" : "h"
    }
    {
        "label" : "logout",
        "action" : "niri msg action quit",
        "text" : "Logout",
        "keybind" : "e"
    }
    {
        "label" : "shutdown",
        "action" : "systemctl poweroff",
        "text" : "Shutdown",
        "keybind" : "s"
    }
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
        background-color: alpha(@base, 0.85);
      }

      button {
        color: @text;
        background-color: alpha(@surface0, 0.9);
        border-radius: 12px;
        border: 1px solid alpha(@surface1, 0.9);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        margin: 20px;
        transition: all 0.2s ease;
      }

      button:hover {
        background-color: alpha(@surface1, 0.9);
      }

      button:focus {
        background-color: alpha(@surface1, 0.9);
      }

      #lock:hover      { border: 1px solid alpha(@blue, 0.9); }
      #logout:hover    { border: 1px solid alpha(@yellow, 0.9); }
      #suspend:hover   { border: 1px solid alpha(@teal, 0.9); }
      #hibernate:hover { border: 1px solid alpha(@mauve, 0.9); }
      #shutdown:hover  { border: 1px solid alpha(@red, 0.9); }
      #reboot:hover    { border: 1px solid alpha(@peach, 0.9); }

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
