{ colors }:
let
  inherit (colors) mocha macchiato;
in
''
  @define-color bg-crust     ${macchiato.crust};
  @define-color bg-surface0  ${macchiato.surface0};
  @define-color bg-surface1  ${macchiato.surface1};

  @define-color fg-text      ${macchiato.text};
  @define-color fg-subtext   ${macchiato.subtext0};

  @define-color accent-mauve     ${macchiato.mauve};
  @define-color accent-red       ${macchiato.red};
  @define-color accent-green     ${macchiato.green};
  @define-color accent-yellow    ${macchiato.yellow};
  @define-color accent-sky       ${macchiato.sky};
  @define-color accent-blue      ${macchiato.blue};
  @define-color accent-teal      ${macchiato.teal};
  @define-color accent-pink      ${macchiato.pink};
  @define-color accent-rosewater ${macchiato.rosewater};

  * {
    border: none;
    border-radius: 0;
    font-family: "JetBrainsMono Nerd Font";
    font-weight: 600;
    font-size: 13px;
    min-height: 0;
    border-radius: 8px;
  }

  /* ----------------------------------------------------------------
     Bar shell
  ---------------------------------------------------------------- */

  window#waybar {
    background-color: alpha(@bg-crust, 0.55);
    padding: 0 8px;
    box-shadow: 0 1px 0 rgba(0, 0, 0, 0.35);
  }

  tooltip {
    background-color: alpha(@bg-crust, 0.92);
    border: 1px solid alpha(@bg-surface1, 0.6);
  }

  tooltip label {
    color: @fg-text;
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
    color: @fg-text;
    transition: background-color 0.15s ease, color 0.15s ease;
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
    background-color: alpha(@bg-surface1, 0.65);
  }

  /* ============================================================ left == */

  #custom-launcher {
    background-color: alpha(@accent-mauve, 0.85);
    color: @bg-crust;
    font-size: 15px;
    padding: 0 14px;
    margin: 0 6px 0 6px;
    border-radius: 10px;
  }

  #custom-launcher:hover {
    background-color: @accent-mauve;
  }

  #memory,
  #temperature,
  #cpu {
    background-color: alpha(@bg-surface0, 0.45);
    padding: 0 10px;
  }

  #memory {
    border-radius: 10px 0 0 10px;
    border-right: 1px solid alpha(@bg-surface1, 0.5);
    color: @accent-sky;
  }

  #temperature {
    border-right: 1px solid alpha(@bg-surface1, 0.5);
    color: @accent-yellow;
  }

  #temperature.critical {
    color: @accent-red;
  }

  #cpu {
    border-radius: 0 10px 10px 0;
    margin-right: 6px;
    color: @accent-green;
  }

  #clock {
    background-color: alpha(@bg-surface0, 0.45);
    color: @accent-rosewater;
    padding: 0 14px;
    border-radius: 10px;
  }

  /* ========================================================== center == */

  #workspaces {
    background-color: alpha(@bg-surface0, 0.4);
    border-radius: 10px;
    padding: 0 8px;
    margin: 0 6px;
  }

  #workspaces button {
    padding: 0 7px;
    margin: 0 2px;
    min-width: 8px;
    border-radius: 6px;
    background-color: transparent;
    color: @fg-subtext;
    transition: background-color 0.15s ease, color 0.15s ease;
  }

  #workspaces button:hover {
    background-color: alpha(@bg-surface1, 0.6);
    color: @fg-text;
  }

  #workspaces button.focused {
    background-color: @accent-mauve;
    color: @bg-crust;
  }

  #workspaces button.urgent {
    background-color: @accent-red;
    color: @bg-crust;
  }

  #mpris {
    background-color: alpha(@bg-surface0, 0.4);
    color: @accent-teal;
    padding: 0 14px;
    margin: 0 6px 0 0;
    border-radius: 10px;
  }

  /* =========================================================== right == */

  #network,
  #pulseaudio,
  #backlight {
    background-color: alpha(@bg-surface0, 0.45);
    padding: 0 10px;
  }

  #network {
    border-radius: 10px 0 0 10px;
    border-right: 1px solid alpha(@bg-surface1, 0.5);
    color: @accent-blue;
  }

  #pulseaudio {
    border-right: 1px solid alpha(@bg-surface1, 0.5);
    color: @accent-mauve;
  }

  #backlight {
    border-radius: 0 10px 10px 0;
    margin-right: 6px;
    color: @accent-yellow;
  }

  #tray {
    background-color: alpha(@bg-surface0, 0.45);
    padding: 0 10px;
    margin-right: 6px;
    border-radius: 10px;
  }

  #power-profiles-daemon,
  #battery {
    background-color: alpha(@bg-surface0, 0.45);
    padding: 0 10px;
  }

  #power-profiles-daemon {
    border-radius: 10px 0 0 10px;
    border-right: 1px solid alpha(@bg-surface1, 0.5);
    color: @accent-pink;
  }

  #battery {
    border-radius: 0 10px 10px 0;
    margin-right: 6px;
    color: @fg-text;
  }

  #battery.charging {
    color: @accent-green;
  }

  #battery.warning:not(.charging) {
    color: @accent-yellow;
  }

  #battery.critical:not(.charging) {
    color: @accent-red;
    animation: blink 1s linear infinite alternate;
  }

  @keyframes blink {
    to {
      opacity: 0.4;
    }
  }

  #custom-power,
  #custom-reboot,
  #custom-lock,
  #custom-quit {
    background-color: alpha(@accent-red, 0.85);
    color: @bg-crust;
    font-size: 15px;
    padding: 0 14px;
    border-radius: 10px;
    margin: 0 6px 0 0;
  }

  #custom-power:hover,
  #custom-reboot:hover,
  #custom-lock:hover,
  #custom-quit:hover {
    background-color: @accent-red;
  }
''
