{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  attrs = customize.graphics.attrs;
in
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
      mainBar =
        # lib.optionalAttrs (attrs.monitor-primary != "") {
        #   output = attrs.monitor-primary;
        # }
        # //
        {
          layer = "top";
          position = "top";
          mode = "dock";
          height = 32;
          spacing = 8;
          # margin = "0";

          modules-left = [
            "hyprland/windowcount"
            "hyprland/workspaces"
            "group/monitor"
            "hyprland/window"
          ];
          modules-center = [
            "clock"
            "custom/weather"
          ];
          modules-right = [
            "wlr/taskbar"
            "custom/separator"
            "tray"
            "custom/separator"
            "idle_inhibitor"
            "network"
            "temperature"
            "bluetooth"
            "pulseaudio"
            # "pulseaudio/slider"
            "battery"
            "backlight"
            "privacy"
            "custom/power"
          ];

          "custom/separator" = {
            format = "|";
            tooltip = false;
          };

          # 左侧模块
          # 当前工作区窗口数 ✅
          "hyprland/windowcount" = {
            format = "󱂬 {}";
            format-empty = "󱂬 x";
            # format-windowed = "[T]";
            # format-fullscreen= "[{}]";
            separate-outputs = true;
          };
          # 工作区 ✅
          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              urgent = "◉";
              active = "⊛";
              visible = "";
              default = "○";
              empty = "○";
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
            max-length = 10;
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
            ];
          };

          # 监控组 - cpu ✅
          cpu = {
            interval = 15;
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
            on-click = "missioncenter";
          };
          # 监控组 - 内存 ✅
          memory = {
            interval = 15;
            format = " {percentage}%";
            states = {
              warning = 70;
              critical = 90;
            };
            tooltip = true;
            tooltip-format = "{used:0.1f}GB / {total:0.1f}GB\nAvail: {avail:0.1f}GB";
            on-click = "missioncenter";
          };
          # 监控组 - 硬盘 ✅
          disk = {
            interval = 300;
            format = "󰋊 {percentage_used}%";
            path = "/";
            tooltip = true;
            tooltip-format = "{used} / {total}\nAvail: {free} ({percentage_free}%)";
            on-click = "missioncenter";
          };
          # 监控组 - 硬盘 - home ✅
          "disk#home" = {
            interval = 300;
            format = "󰋊 Home {percentage_used}%";
            path = "/home/";
            tooltip = true;
            tooltip-format = "{used} / {total}\nAvail: {free} ({percentage_free}%)";
            on-click = "missioncenter";
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
              on-click = "mode";
              on-scroll-up = "shift_down";
              on-scroll-down = "shift_up";
            };
          };

          # 天气 ✅
          "custom/weather" = {
            interval = 3600;
            exec = "wttrbar --lang=zh --location Fuzhou";
            format = "Weather {} ";
            return-type = "json";
            on-click = "google-chrome https://wttr.in";
          };

          # 左侧模块

          # 任务栏 ✅
          "wlr/taskbar" = {
            format = "{icon}";
            icon-theme = "Numix-Circle";
            tooltip = true;
            tooltip-format = "{title}";
            on-click = "activate";
          };
          # 托盘 ✅
          tray = {
            spacing = 8;
          };
          # 空闲抑制器 ✅
          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "☕️";
              deactivated = "🫗";
            };
          };
          # 网络 ✅
          network = {
            interval = 3;
            format = "{ifname}";
            format-wifi = "{icon}  {bandwidthUpBytes}  {bandwidthDownBytes}";
            format-ethernet = "󰈁  {bandwidthUpBytes}  {bandwidthDownBytes}";

            # format = "{ifname}";
            # format-wifi = "{icon}";
            # format-ethernet = "󰈁";
            format-disconnected = "󰈂";
            format-linked = "󰈁 {ifname} (No IP)";
            tooltip = true;
            tooltip-format = "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
            tooltip-format-wifi = "{essid} {icon} {signalStrength}%\n-----------------------\n\nIP: {ipaddr}\nGateway: {gwaddr}\nNetmask: {netmask}";
            tooltip-format-ethernet = "󰌘 {ifname}\n-----------------------\n\nIP: {ipaddr}\nGateway: {gwaddr}\nNetmask: {netmask}";
            tooltip-format-disconnected = "󰌙 Disconnected";
            max-length = 30;
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            on-click = "nm-connection-editor";
          };

          # 温度
          temperature = {
            interval = 30;
            hwmon-path = [ "/sys/class/hwmon/hwmon2/temp1_input" ];
            critical-threshold = 80;
            format-critical = " {temperatureC}°C";
            format = " {temperatureC}°C";
          };
          # 蓝牙 ✅
          # BUG: 耳机连接成功, 但鼠标连不上!!
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
          # 音量 ✅
          pulseaudio = {
            format = "{icon} {volume}%";
            format-bluetooth = "󰂰 {volume}%";
            format-muted = "󰸈 Mute";
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
            scroll-step = 3;
            ignored-sinks = [ "Easy Effects Sink" ];
            on-click = "pavucontrol";
            on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };
          # 音量滑块 ✅
          "pulseaudio/slider" = {
            min = 0;
            max = 100;
            orientation = "horizontal";
          };
          # 显示器背光 ✅
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
            scroll-step = 1.0;
          };
          # 电量
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

          # 隐私 ✅
          privacy = {
            modules = [
              {
                type = "screenshare";
                tooltip = true;
                tooltip-icon-size = 24;
              }
              {
                type = "audio-in";
                tooltip = true;
                tooltip-icon-size = 24;
              }
              {
                type = "audio-in";
                tooltip = true;
                tooltip-icon-size = 24;
              }
            ];
            ignore-monitor = true;
            ignore = [ ];
          };
          # 电源 ✅
          "custom/power" = {
            format = "⏻";
            on-click = "wlogout -b 3";
            # on-click = "wlogout -b 2";
            tooltip = false;
          };
        };
    };
    style = builtins.readFile ./style.gtk.css;
  };
}
