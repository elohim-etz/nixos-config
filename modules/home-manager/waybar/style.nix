{ colors }:
let
  inherit (colors) mocha macchiato;
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
    background-color: rgba(${mocha.baseRGB}, 0.52);
    padding: 0 10px;
    box-shadow: 0 1px 0 rgba(0, 0, 0, 0.35);
  }

  tooltip {
    background-color: rgba(${macchiato.crustRGB}, 0.85);
    border: 1px solid rgba(${macchiato.surface1RGB}, 0.6);
    border-radius: 8px;
  }

  tooltip label {
    color: ${macchiato.text};
    padding: 2px 4px;
  }

  #custom-launcher,
  #memory,
  #temperature,
  #cpu,
  #clock,
  #workspaces,
  #mpris,
  #network,
  #pulseaudio,
  #backlight,
  #tray,
  #power-profiles-daemon,
  #battery,
  #group-power,
  #custom-power {
    color: ${macchiato.text};
  }

  #memory:hover,
  #temperature:hover,
  #cpu:hover,
  #clock:hover,
  #mpris:hover,
  #network:hover,
  #pulseaudio:hover,
  #backlight:hover,
  #tray:hover,
  #power-profiles-daemon:hover,
  #battery:hover {
    background-color: rgba(${macchiato.surface1RGB}, 0.6);
  }

  /* ============================================================ left == */

  #custom-launcher {
    background-color: rgba(${macchiato.mauveRGB}, 0.8);
    color: ${mocha.crust};
    font-size: 15px;
    padding: 0 14px;
    margin: 0 6px 0 6px;
    border-radius: 8px;
    transition: background-color 0.2s ease;
  }

  #custom-launcher:hover {
    background-color: ${macchiato.mauve};
  }

  #memory,
  #temperature,
  #cpu {
    background-color: rgba(${macchiato.surface0RGB}, 0.42);
    padding: 0 10px;
  }

  #memory {
    border-radius: 8px 0 0 8px;
    border-right: 1px solid rgba(${macchiato.surface1RGB}, 0.5);
  }

  #temperature {
    border-right: 1px solid rgba(${macchiato.surface1RGB}, 0.5);
    border-radius: 0;
  }

  #cpu {
    border-radius: 0 8px 8px 0;
    margin-right: 6px;
  }

  #clock {
    background-color: rgba(${macchiato.surface0RGB}, 0.42);
    padding: 0 14px;
    border-radius: 8px;
  }

  /* ========================================================== center == */

  #workspaces {
    background-color: rgba(${macchiato.surface0RGB}, 0.35);
    border-radius: 8px;
    padding: 0 8px;
    margin: 0 6px;
  }

  #workspaces button {
    padding: 0 7px;
    margin: 0 2px;
    min-width: 8px;
    border-radius: 5px;
    background-color: transparent;
    color: ${macchiato.subtext0};
  }

  #workspaces button:hover {
    background-color: rgba(${macchiato.overlay1RGB}, 0.55);
    color: ${macchiato.text};
  }

  #workspaces button.focused {
    background-color: ${macchiato.mauve};
    color: ${mocha.crust};
  }

  #workspaces button.urgent {
    background-color: ${macchiato.red};
    color: ${mocha.crust};
  }

  #mpris {
    background-color: rgba(${macchiato.surface0RGB}, 0.35);
    color: ${macchiato.green};
    padding: 0 14px;
    margin: 0 6px 0 0;
    border-radius: 8px;
  }

  /* =========================================================== right == */

  #network,
  #pulseaudio,
  #backlight {
    background-color: rgba(${macchiato.surface0RGB}, 0.42);
    padding: 0 10px;
  }

  #network {
    border-radius: 8px 0 0 8px;
    border-right: 1px solid rgba(${macchiato.surface1RGB}, 0.5);
    color: ${macchiato.blue};
  }

  #pulseaudio {
    border-right: 1px solid rgba(${macchiato.surface1RGB}, 0.5);
    color: ${macchiato.mauve};
    border-radius: 0;
  }

  #backlight {
    border-radius: 0 8px 8px 0;
    margin-right: 6px;
    color: ${macchiato.yellow};
  }

  #tray {
    background-color: rgba(${macchiato.surface0RGB}, 0.42);
    padding: 0 10px;
    margin-right: 6px;
    border-radius: 8px;
  }

  #power-profiles-daemon,
  #battery {
    background-color: rgba(${macchiato.surface0RGB}, 0.42);
    padding: 0 10px;
  }

  #power-profiles-daemon {
    border-radius: 8px 0 0 8px;
    border-right: 1px solid rgba(${macchiato.surface1RGB}, 0.5);
    color: ${macchiato.pink};
  }

  #battery {
    border-radius: 0 8px 8px 0;
    margin-right: 6px;
  }

  #battery.charging {
    color: ${macchiato.green};
  }

  #battery.warning:not(.charging) {
    color: ${macchiato.yellow};
  }

  #battery.critical:not(.charging) {
    color: ${macchiato.red};
    animation: blink 1s linear infinite alternate;
  }

  @keyframes blink {
    to {
      opacity: 0.4;
    }
  }

  #temperature {
    color: ${macchiato.yellow};
  }

  #temperature.critical {
    color: ${macchiato.red};
  }

  #memory {
    color: ${macchiato.sky};
  }

  #cpu {
    color: ${macchiato.green};
  }

  #custom-power,
  #custom-reboot,
  #custom-lock,
  #custom-quit {
    background-color: rgba(${macchiato.redRGB}, 0.8);
    color: ${mocha.crust};
    font-size: 15px;
    padding: 0 14px;
    border-radius: 8px;
    margin: 0 6px 0 0;
    transition: background-color 0.2s ease;
  }

  #custom-power:hover,
  #custom-reboot:hover,
  #custom-lock:hover,
  #custom-quit:hover {
    background-color: ${macchiato.red};
  }
''
