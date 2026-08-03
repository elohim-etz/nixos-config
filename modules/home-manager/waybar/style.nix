{ colors }:
let
  inherit (colors) mocha tooltip;
in
''
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

  tooltip {
    background: ${tooltip.bg};
    border-radius: 8px
  }

  tooltip label {
    color: ${tooltip.fg};
   }

  /* Left side modules */
  #custom-launcher {
    background-color: ${mocha.mantle};
    color: ${mocha.text};
    padding: 0 15px;
    margin: 1px 0 1px 5px;
    border-radius: 8px;
  }

  #memory,
  #temperature,
  #cpu {
    background-color: ${mocha.mantle};
    color: ${mocha.text};
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
    background-color: ${mocha.mantle};
    color: ${mocha.text};
    padding: 0 15px;
    margin: 1px 0 1px 8px;
    border-radius: 8px;
  }

  #mpris {
    background-color: ${mocha.mantle};
    color: ${mocha.green};
    padding: 0 15px;
    margin: 1px 8px;
    border-radius: 8px;
  }

  /* Center - workspaces */
  #workspaces {
    background-color: ${mocha.mantle};
    border-radius: 8px;
    padding: 1px 6px;
    margin: 1px 4px;
  }
  #workspaces button {
    padding: 0 2px 0 1px;
    margin: 0;
    min-width: 21px;
    min-height: 21px;
    border: none;
    border-radius: 8px;
    background-color: transparent;
    color: ${mocha.overlay0};
    transition: background-color 0.15s ease;
  }
  #workspaces button.active {
    padding: 0 0 0 2px;
    color: ${mocha.text};
    border-radius: 8px;
  }
  #workspaces button.urgent {
    background-color: rgba(${mocha.redRGB}, 0.2);
    color: ${mocha.red};
  }

  /* Right side modules */
  #network {
    background-color: ${mocha.mantle};
    color: ${mocha.text};
    padding: 0 12px;
    margin: 1px 0 1px 8px;
    border-radius: 8px;
  }

  #pulseaudio,
  #backlight {
    background-color: ${mocha.mantle};
    color: ${mocha.text};
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
    background-color: ${mocha.mantle};
    padding: 0 10px;
    margin: 1px 0 1px 8px;
    border-radius: 8px;
  }

  #power-profiles-daemon,
  #battery,
  #custom-power {
    background-color: ${mocha.mantle};
    color: ${mocha.text};
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
    padding: 0 15px 0 6px
  }

  #battery.charging {
    color: ${mocha.green};
  }

  #battery.warning:not(.charging) {
    color: ${mocha.yellow};
  }

  #battery.critical:not(.charging) {
    color: ${mocha.red};
    animation: blink 0.5s linear infinite alternate;
  }

  @keyframes blink {
    to {
      opacity: 0.5;
    }
  }

  #temperature.critical {
    color: ${mocha.red};
  }

  /* Module-specific colors */
  #memory {
    color: ${mocha.sky};
  }

  #temperature {
    color: ${mocha.yellow};
  }

  #cpu {
    color: ${mocha.green};
  }

  #power-profiles-daemon {
    color: ${mocha.pink};
  }

  #network {
    color: ${mocha.blue};
  }

  #pulseaudio {
    color: ${mocha.mauve};
  }

  #backlight {
    color: ${mocha.yellow};
  }
''
