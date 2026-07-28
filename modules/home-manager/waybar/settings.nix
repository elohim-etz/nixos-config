{ colors }:
let
  inherit (colors) macchiato;
in
{
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
    "group/group-power"
  ];

  # ---------------------------------------------------------------- left --

  "custom/launcher" = {
    format = " ";
    on-click = "pkill wofi || wofi --show drun";
    tooltip = false;
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
    format-c = " {used}GB";
    format-alt = "󰾆 {percentage}%";

    max-length = 10;

    tooltip = true;
    tooltip-format = ''
      󰾆 {percentage}%
       {used:0.1f}GB/{total:0.1f}GB
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
    format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
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
        months = "<span color='${macchiato.rosewater}'><b>{}</b></span>";
        weekdays = "<span color='${macchiato.yellow}'><b>{}</b></span>";
        today = "<span color='${macchiato.pink}'><b>{}</b></span>";
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

  # -------------------------------------------------------------- center --

  "niri/workspaces" = {
    disable-click = false;
    all-outputs = false;
    format = "{value}";

    on-scroll-up = "niri msg action focus-workspace-up";
    on-scroll-down = "niri msg action focus-workspace-down";
  };

  mpris = {
    justify = "center";
    interval = 1;
    max-length = 40;

    format = "{player_icon} {title} [{position}/{length}]";
    format-paused = "{status_icon} <i>{title}</i> [{position}/{length}]";
    format-stopped = "{status_icon}";

    dynamic-separator = "  ";

    player-icons = {
      default = "󱅫";
      mpv = " ";
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
    on-click-right = "playerctl next";
    on-scroll-up = "playerctl position 1+";
    on-scroll-down = "playerctl position 1-";

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

  # --------------------------------------------------------------- right --

  network = {
    interval = 2;
    rotate = 0;

    tooltip = true;

    format-wifi = "<span foreground='${macchiato.pink}'> {bandwidthDownBytes}</span> <span foreground='${macchiato.teal}'> {bandwidthUpBytes}</span>";
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
        default = ["" "" ""];
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

  "tray" = {
    icon-size = 15;
    spacing = 8;
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
      balanced = "";
      power-saver = "";
    };
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

    format-icons = [ "󰥇" "󰤾" "󰤿" "󰥀" "󰥁" "󰥂" "󰥃" "󰥄" "󰥅" "󰥆" "󰥈" ];
  };

  "group/group-power" = {
    orientation = "horizontal";

    drawer = {
      "transition-duration" = 500;
      "children-class" = "not-power";
      "transition-left-to-right" = false;
    };

    modules = [
      "custom/power"   # First element is the group leader and won't ever be hidden
      "custom/quit"
      "custom/lock"
      "custom/reboot"
    ];
  };

  "custom/quit" = {
    format = "󰗼";
    tooltip = false;
    "on-click" = "niri msg action quit";
  };

  "custom/lock" = {
    format = "󰍁";
    tooltip = false;
    "on-click" = "hyprlock & disown && systemctl suspend";
  };

  "custom/reboot" = {
    format = "󰜉";
    tooltip = false;
    "on-click" = "reboot";
  };

  "custom/power" = {
    format = "{}";
    rotate = 0;
    exec = "echo ; echo  logout";
    on-click = "wlogout";
    interval = 86400;
    tooltip = true;
  };
}
