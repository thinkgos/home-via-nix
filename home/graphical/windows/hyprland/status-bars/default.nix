{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 状态栏
  # https://wiki.hypr.land/Useful-Utilities/Status-Bars/

  # https://github.com/Alexays/Waybar/wiki
  # https://github.com/Alexays/Waybar/wiki/Module:-Hyprland
  # https://github.com/Alexays/Waybar/wiki/Configuration
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mode = "dock";
        height = 32;
        spacing = 8;
        # margin = "0";

        modules-left = [
          "hyprland/workspaces"
          "group/monitor"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
          "custom/weather"
          "backlight"
        ];
        modules-right = [
          "tray"
          "network"
          "temperature"
          "bluetooth"
          "pulseaudio"
          "battery"
          # "custom/power"
        ];

        # 左侧模块

        # 工作区 ✅
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "⊛";
            default = "○";
            urgent = "◉";
          };
          active-only = false;
          all-outputs = true;
          persistent-workspaces = {
            "*" = 4;
          };
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
        };
        # 窗口 ✅
        "hyprland/window" = {
          format = "👉 {}";
          max-length = 40;
          separate-outputs = true;
        };

        # 监控组 ✅
        "group/monitor" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
            "disk"
            "disk#home"
            "custom/gpu"
          ];
        };

        # 监控组 - cpu ✅
        cpu = {
          interval = 10;
          tooltip = true;
          format = " {icon} {load}%";
          format-icons = [
            "<span color='#69ff94'>▁</span>" # green
            "<span color='#2aa9ff'>▂</span>" # blue
            "<span color='#f8f8f2'>▃</span>" # white
            "<span color='#f8f8f2'>▄</span>" # white
            "<span color='#ffffa5'>▅</span>" # yellow
            "<span color='#ffffa5'>▆</span>" # yellow
            "<span color='#ff9977'>▇</span>" # orange
            "<span color='#dd532e'>█</span>" # red
          ];
          on-click-right = "missioncenter";
        };
        # 监控组 - 内存 ✅
        memory = {
          interval = 30;
          format = " {percentage}%";
          states = {
            warning = 70;
            critical = 90;
          };
          tooltip = true;
          tooltip-format = "{used:0.1f}GB / {total:0.1f}GB\nAvail: {avail:0.1f}GB";
          on-click-right = "missioncenter";
        };
        # 监控组 - 硬盘 ✅
        disk = {
          interval = 300;
          format = "󰋊 {percentage_used}%";
          path = "/";
          tooltip = true;
          tooltip-format = "{used} / {total}\nAvail: {free} ({percentage_free}%)";
          on-click-right = "missioncenter";
        };
        # 监控组 - 硬盘 - home ✅
        "disk#home" = {
          interval = 300;
          format = "󰋊 Home {percentage_used}%";
          path = "/home";
          tooltip = true;
          tooltip-format = "{used} / {total}\nAvail: {free} ({percentage_free}%)";
          on-click-right = "missioncenter";
        };
        # 监控组 - GPU ✅
        "custom/gpu" = {
          exec = "blast-gpu-name";
          tooltip = true;
          tooltip-format = "Click For More Info 👀";
          on-click-right = "missioncenter";
        };

        # 中间模块

        # 时钟 ✅
        clock = {
          interval = 60;
          format = " {:%m月%d日 %H:%M - %a}";
          format-alt = " {:%Y年%m月%d日 %H:%M - %A}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_down";
            on-scroll-down = "shift_up";
          };
        };

        # 天气 ✅
        "custom/weather" = {
          interval = "3600";
          exec = "wttrbar --lang=zh --location Fuzhou";
          format = "Weather {} ";
          return-type = "json";
          on-click-right = "google-chrome https://wttr.in";
        };

        backlight = {
          # device = "intel_backlight";
          format = "{icon} {percent}% ";
          format-icons = [
            "󱩎 "
            "󱩏 "
            "󱩑 "
            "󱩒 "
            "󱩓 "
            "󱩔 "
            "󱩖 "
          ];
          scroll-step = 0.15;
          # on-click = "brightnessctl set 5%+";
          # on-click-right = "brightnessctl set 5%-";
        };

        # 左侧模块

        # 托盘 ✅
        tray = {
          spacing = 8;
        };
        # network = {
        #   format-wifi = "  {signalStrength}%";
        #   format-ethernet = " ";
        #   format-disconnected = "⚠ ";
        #   tooltip-format = "{ifname}: {ipaddr}/{cidr}\n{essid} ({signalStrength}%)";
        # };
        network = {
          format = "{ifname}";
          format-wifi = "{icon}";
          format-ethernet = "󰌘";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} 󰌘";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 30;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          on-click-right = "nm-connection-editor";
        };
        # "network#speed" = {
        #   "interval" = 1;
        #   "format" = "{ifname}";
        #   "format-wifi" = "{icon}  {bandwidthUpBytes}  {bandwidthDownBytes}";
        #   "format-ethernet" = "󰌘  {bandwidthUpBytes}  {bandwidthDownBytes}";
        #   "format-disconnected" = "󰌙";
        #   "tooltip-format" = "{ipaddr}";
        #   "format-linked" = "󰈁 {ifname} (No IP)";
        #   "tooltip-format-wifi" = "{essid} {icon} {signalStrength}%";
        #   "tooltip-format-ethernet" = "{ifname} 󰌘";
        #   "tooltip-format-disconnected" = "󰌙 Disconnected";
        #   "min-length" = 24;
        #   "max-length" = 24;
        #   "format-icons" = [
        #     "󰤯"
        #     "󰤟"
        #     "󰤢"
        #     "󰤥"
        #     "󰤨"
        #   ];
        # };
        # 温度
        temperature = {
          interval = 10;
          hwmon-path = [ "/sys/class/hwmon/hwmon2/temp1_input" ];
          critical-threshold = 80;
          format-critical = " {temperatureC}°C";
          format = " {temperatureC}°C";
        };
        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "blueman-manager";
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 {volume}%";
          format-muted = "󰝟 Mute";
          format-icons = {
            headphone = "";
            hands-free = "󱡒";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          scroll-step = 5;
          ignored-sinks = [ "Easy Effects Sink" ];
          on-click = "pavucontrol";
          # on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "{timeTo}";
        };

        # "custom/power" = {
        #   format = "⏻";
        #   on-click = "hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
        #   on-click-right = "hyprlock";
        #   tooltip = true;
        #   tooltip-format = "左键: 关机\n右键: 锁屏";
        # };
      };
    };
    style = builtins.readFile ./waybar/style.gtk.css;
  };
}
