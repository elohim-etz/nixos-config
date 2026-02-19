{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ wlogout ];
  
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
        "action" : "hyprctl dispatch exit",
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
    * {
      background-image: none;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
    }
    
    window {
      background-color: rgba(30, 30, 46, 0.9);
    }
    
    button {
      color: #cdd6f4;
      background-color: rgba(49, 50, 68, 0.8);
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
}
