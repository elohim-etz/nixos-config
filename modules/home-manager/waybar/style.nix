{colors}: ''
  * {
    border: none;
    font-family: "JetBrainsMono Nerd Font";
    font-weight: 600;
    font-size: 13px;
  }

  window#waybar {
    background: transparent;
  }

  tooltip {
    background: rgb(48, 45, 65);
    border-radius: 8px;
  }

  tooltip label {
    color: rgb(217, 224, 238);
   }

   #custom-launcher,
   #memory,
   #temperature,
   #cpu,
   #clock,
   #mpris,
   #workspaces,
   #network,
   #pulseaudio,
   #backlight,
   #tray,
   #power-profiles-daemon,
   #battery,
   #custom-power {
       background-color: ${colors.mantle};
       color: ${colors.text};
       min-height: 20px;
       margin: 2px 6px;
       padding: 0px 12px 0px 12px;
       border-radius: 16px;
   }

   #custom-launcher {
       padding-left: 14px;
   }

  #memory {
    border-radius: 16px 0 0 16px;
    margin-right: 0px;
    padding-right: 6px;
  }

  #temperature {
    border-radius: 0;
    margin-left: 0;
    margin-right: 0;
    padding-left: 6px;
    padding-right: 6px;
  }

  #cpu {
    border-radius: 0 16px 16px 0;
    margin-left: 0px;
    padding-left: 6px;
  }

  /* Center - workspaces */
  #workspaces {
    padding: 0 7px 0 4px;
  }
  #workspaces button {
    color: ${colors.surface2};
    padding: 0 1px 0 1px;
    margin: 0;
    min-width: 20px;
    min-height: 21px;
    border: none;
    background-color: transparent;
    transition: background-color 0.15s ease;
  }
  #workspaces button:hover {
      color: ${colors.subtext0};
  }
  #workspaces button.active {
    padding: 0 0;
    color: ${colors.text};
  }
  #workspaces button.urgent {
    background-color: rgba(${colors.redRgb}, 0.2);
    color: ${colors.red};
  }

  /* Right side modules */
  #pulseaudio {
    border-radius: 16px 0 0 16px;
    margin-right: 0;
    padding-right: 6px;
  }

  #backlight {
    border-radius: 0 16px 16px 0;
    margin-left: 0;
    padding-left: 6px;
  }

  #power-profiles-daemon {
    border-radius: 16px 0 0 16px;
    margin-right: 0px;
    padding-right: 6px;
  }

  #battery {
    border-radius: 0;
    margin-left: 0;
    margin-right: 0;
    padding-left: 6px;
    padding-right: 6px;
  }

  #custom-power {
    border-radius: 0 16px 16px 0;
    margin-left: 0px;
    padding-left: 6px;
    padding-right: 14px;
  }

  #battery.charging {
    color: ${colors.green};
  }

  #battery.warning:not(.charging) {
    color: ${colors.yellow};
  }

  #battery.critical:not(.charging) {
    color: ${colors.red};
    animation: blink 0.5s linear infinite alternate;
  }

  @keyframes blink {
    to {
      opacity: 0.5;
    }
  }

  #temperature.critical {
    color: ${colors.red};
  }
''
