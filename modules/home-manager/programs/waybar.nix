{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;

        modules-left = [
          "custom/launcher"
          "memory"
          "temperature"
          "cpu"
          "clock"
        ];

        modules-center = [
          "niri/workspaces"
          "mpris"
        ];

        modules-right = [
          "network"
          "pulseaudio"
          "backlight"
          "tray"
          "power-profiles-daemon"
          "battery"
          "custom/power"
        ];

        # Module configurations

        "custom/power" = {
          format = "{}";
          rotate = 0;
          exec = "echo ; echo  logout";
          on-click = "wlogout";
          interval = 86400;
          tooltip = true;
        };

        "custom/launcher" = {
          format = " ";
          on-click = "pkill wofi || wofi --show drun";
          tooltip = false;
        };

        "niri/workspaces" = {
          disable-click = false;
          all-outputs = false;
          format = "{icon}";

          format-icons = {
            default = "";
          };

          on-scroll-up = "niri msg action focus-workspace-up";
          on-scroll-down = "niri msg action focus-workspace-down";
        };

        memory = {
          states = {
            c = 90;
            h = 60;
            m = 30;
          };

          interval = 30;
          format = "󰾆 {used}GB";
          format-m = "󰾅 {used}GB";
          format-h = "󰓅 {used}GB";
          format-c = " {used}GB";
          format-alt = "󰾆 {percentage}%";

          max-length = 10;

          tooltip = true;
          tooltip-format = ''
            󰾆 {percentage}%
             {used:0.1f}GB/{total:0.1f}GB
          '';
        };

        temperature = {
          hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
          critical-threshold = 80;

          format = " {temperatureC}°C";
          format-critical = " {temperatureC}°C";
        };

        cpu = {
          interval = 10;
          format = "󰍛 {usage}%";
          rotate = 0;

          format-alt = "{icon0}{icon1}{icon2}{icon3}";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip = true;

          tooltip-format = ''
            Power profile: {profile}
            Driver: {driver}
          '';

          format-icons = {
            default = "null";
            performance = "";
            balanced = " ";
            power-saver = "";
          };
        };

        clock = {
          rotate = 0;

          format = "󰥔 {:%R 󰃭 %d·%m·%y}";
          format-alt = "{:%I:%M %p}";

          tooltip-format = "<span>{calendar}</span>";

          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-scroll = 1;
            on-click-right = "mode";

            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b>{}</b></span>";
            };
          };

          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        mpris = {
          justify = "center";
          interval = 1;
          max-length = 50;

          format = "{player_icon} {title} [{position}/{length}]";
          format-paused = "{status_icon} <i>{title}</i> [{position}/{length}]";
          format-stopped = "{status_icon}";

          dynamic-separator = "  ";

          player-icons = {
            default = "󱅫";
            mpv = "🎵";
            spotify = " ";
            vlc = "";
          };

          status-icons = {
            paused = "";
            playing = "";
            stopped = "";
          };

          on-click = "playerctl play-pause";
          on-click-middle = "playerctl previous";
          on-scroll-up = "playerctl position 1-";
          on-scroll-down = "playerctl position 1+";

          tooltip = true;

          tooltip-format = ''
            {title}
            by: {artist}
            {position} / {length}
            Player: {player}

            󰐎 Click to play/pause
            󰺤 Scroll to seek
            󰙤 Middle click previous
            󰙢 Right click next
          '';

          tooltip-format-stopped = ''
            Player: {player}

            󰐎 Click to play/pause
            󰺤 Scroll to seek
            󰙤 Middle click previous
            󰙢 Right click next
          '';
        };

        network = {
          interval = 2;
          rotate = 0;

          tooltip = true;

          format-wifi = "<span foreground='#f5c2e7'> {bandwidthDownBytes}</span> <span foreground='#94e2d5'> {bandwidthUpBytes}</span>";
          format-ethernet = "󰈀 ";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          format-alt = " ";

          tooltip-format = ''
            Network: <big><b>{essid}</b></big>
            Signal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>
            Frequency: <b>{frequency}MHz</b>
            Interface: <b>{ifname}</b>
            IP: <b>{ipaddr}/{cidr}</b>
            Gateway: <b>{gwaddr}</b>
            Netmask: <b>{netmask}</b>
          '';

          tooltip-format-disconnected = "Disconnected";
        };

        pulseaudio = {
          format = "{icon} {volume}";
          rotate = 0;

          on-click = "pavucontrol -t 3";
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";

          tooltip-format = "{icon} {desc} // {volume}%";
          scroll-step = 5;

          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
        };

        backlight = {
          device = "intel_backlight";
          rotate = 0;

          format = "{icon} {percent}%";

          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];

          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";

          min-length = 6;
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };

          rotate = 0;
          interval = 60;

          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";

          format-icons = ["󰥇" "󰤾" "󰤿" "󰥀" "󰥁" "󰥂" "󰥃" "󰥄" "󰥅" "󰥆" "󰥈"];
        };

        "tray" = {
          icon-size = 15;
          spacing = 5;
        };
      };
    };

    style = ''
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
        background: rgb(48, 45, 65);
        border-radius: 8px
      }

      tooltip label {
        color: rgb(217, 224, 238);
       }

      /* Left side modules */
      #custom-launcher {
        background-color: #181825;
        color: #cdd6f4;
        padding: 0 15px;
        margin: 1px 0 1px 5px;
        border-radius: 8px;
      }

      #memory,
      #temperature,
      #cpu {
        background-color: #181825;
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
        background-color: #181825;
        color: #cdd6f4;
        padding: 0 15px;
        margin: 1px 0 1px 8px;
        border-radius: 8px;
      }

      #mpris {
        background-color: #181825;
        color: #a6e3a1;
        padding: 0 15px;
        margin: 1px 8px;
        border-radius: 8px;
      }

      /* Center - workspaces */
      #workspaces {
        background-color: #181825;
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
        background-color: #181825;
        color: #cdd6f4;
        padding: 0 12px;
        margin: 1px 0 1px 8px;
        border-radius: 8px;
      }

      #pulseaudio,
      #backlight {
        background-color: #181825;
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
        background-color: #181825;
        padding: 0 10px;
        margin: 1px 0 1px 8px;
        border-radius: 8px;
      }

      #power-profiles-daemon,
      #battery,
      #custom-power {
        background-color: #181825;
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
  };
}
