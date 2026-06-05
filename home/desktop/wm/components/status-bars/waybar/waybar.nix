{
  config,
  lib,
  pkgs,
  wme,
  customize,
  ...
}:
{
  # 状态栏
  # https://github.com/Alexays/Waybar/wiki
  # https://github.com/Alexays/Waybar/wiki/Configuration
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = {
      mainBar = {
        layer = "top";
        exclusive = true;
        passthrough = true;
        position = "top";
        mode = "dock";
        height = 32;
        spacing = 8;
        # margin = "0";

        modules-left = [
          "hyprland/windowcount"
          "hyprland/workspaces"
          "group/monitor#drawer"
          "wlr/taskbar"
          "hyprland/window"
        ];
        modules-center = [
          "group/clock#drawer"
          "custom/notification"
          "cava"
        ];
        modules-right = [
          "idle_inhibitor"
          "custom/screen#toolbox"
          "custom/separator"
          "tray"
          "custom/separator"
          "network"
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
            "1" = "❶";
            "2" = "❷";
            "3" = "❸";
            "4" = "❹";
            "5" = "❺";
            "6" = "❻";
            "7" = "❼";
            "8" = "❽";
            "9" = "❾";
            # urgent = "◉";
            # active = "⊛";
            # visible = "";
            # default = "○";
            # empty = "○";
          };
          active-only = false;
          all-outputs = false;
          persistent-workspaces = {
            "*" = 2;
          };
          on-click = "activate";
          on-scroll-up = wme.workspace.focus-cycle-prev;
          on-scroll-down = wme.workspace.focus-cycle-next;
        };
        # 窗口 ✅
        "hyprland/window" = {
          format = "💥 {}";
          max-length = 30;
          separate-outputs = true;
          rewrite = {
            "💥 (.*) - Google Chrome" = " $1";
            "💥 (.*) - Visual Studio Code" = " $1";
            "💥 (.*) - vim" = " $1";
            "💥 (.*) - Kitty" = " $1";
            "💥 (.*) - Ghostty" = " $1";
            "💥 (.*) - Alacritty" = " $1";
            "💥 (.*) - zsh" = "󰆍 $1";
          };
          on-click = wme.window.toggle-maximized;
          on-click-right = wme.layout.toggle-split;
        };

        # 任务栏 ✅
        "wlr/taskbar" = {
          format = "{icon}";
          icon-theme = "Numix-Circle";
          tooltip = true;
          tooltip-format = "{title}";
          on-click = "activate";
        };

        # 监控组 ✅
        "group/monitor#drawer" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 500;
            children-class = "not-clock";
            transition-left-to-right = true;
          };
          modules = [
            "group/monitor"
            "group/monitor#expand"
          ];
        };
        "group/monitor" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
          ];
        };
        "group/monitor#expand" = {
          orientation = "horizontal";
          modules = [
            "disk"
            "disk#home"
            "temperature"
          ];
        };

        # 监控组 - cpu ✅
        cpu = {
          interval = 15;
          tooltip = true;
          format = " {icon} {usage}%";
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
          on-click = "${pkgs.mission-center}/bin/missioncenter";
        };
        # 温度
        temperature = {
          interval = 5;
          tooltip = true;
          hwmon-path = [
            "/sys/class/hwmon/hwmon1/temp1_input"
            "/sys/class/thermal/thermal_zone0/temp"
          ];
          critical-threshold = 80;
          format-critical = "󰸁 {temperatureC}°C";
          format = " {temperatureC}°C";
          tooltip-format = " {temperatureC}°C";
        };
        # 监控组 - 内存 ✅
        memory = {
          interval = 10;
          format = " {percentage}%";
          states = {
            warning = 70;
            critical = 90;
          };
          tooltip = true;
          tooltip-format = "{used:0.1f}GB / {total:0.1f}GB\nAvail: {avail:0.1f}GB";
          on-click = "${pkgs.mission-center}/bin/missioncenter";
        };
        # 监控组 - 硬盘 ✅
        disk = {
          interval = 300;
          format = "󰋊 {percentage_used}%";
          path = "/";
          tooltip = true;
          tooltip-format = "{used} / {total}\nAvail: {free} ({percentage_free}%)";
          on-click = "${pkgs.mission-center}/bin/missioncenter";
        };
        # 监控组 - 硬盘数据卷 ✅
        "disk#home" = {
          interval = 300;
          format = "󱘲 {percentage_used}%";
          path = "/mms";
          tooltip = true;
          tooltip-format = "{used} / {total}\nAvail: {free} ({percentage_free}%)";
          on-click = "${pkgs.mission-center}/bin/missioncenter";
        };

        # 时钟组 ✅
        "group/clock#drawer" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            children-class = "not-clock";
            transition-left-to-right = true;
          };
          modules = [
            "clock"
            "custom/weather"
          ];
        };

        # 时钟 ✅
        clock = {
          interval = 60;
          format = " {:%m月%d日 %H:%M}";
          format-alt = " {:%Y年%m月%d日 %H:%M}";
          tooltip-format = "{:%Y年%m月%d日 %A}\n\n<tt><small>{calendar}</small></tt>";
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
          exec = "${pkgs.wttrbar}/bin/wttrbar --lang=zh --location Fuzhou";
          format = "{} ";
          return-type = "json";
          on-click = "google-chrome https://wttr.in";
        };
        "custom/notification" = {
          tooltip = true;
          format = "<span size='16pt'>{icon}</span>";
          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            dnd-notification = "󰂠";
            dnd-none = "󰪓";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          return-type = "json";
          exec-if = "${pkgs.which}/bin/which swaync-client";
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          escape = true;
        };
        # 音频模拟器
        cava = {
          # 更多配置 查看 cava.nix 配置
          cava_config = "${config.xdg.configHome}/cava/waybar-cava-raw.conf";
          # cava_config = "${config.xdg.configHome}/cava/waybar-cava-3.conf"; # BUG, SDL
          input_delay = 2;
          sleep_timer = 5;
          hide_on_silence = true;
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
          actions = {
            on-click-right = "mode";
          };
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
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };

        # 蓝牙 ✅
        # BUG: 耳机连接成功, 但鼠标连不上!!
        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          format-disabled = "󰂲 disabled";
          format-off = "󰂲 off";
          format-no-controller = "";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "${pkgs.blueman}/bin/blueman-manager";
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
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
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
            "🌑"
            "🌒"
            "🌓"
            "🌔"
            "🌕"
          ];
          # format-icons = [
          #   "󱩎 "
          #   "󱩏 "
          #   "󱩑 "
          #   "󱩒 "
          #   "󱩓 "
          #   "󱩔 "
          #   "󱩖 "
          # ];
          scroll-step = 1.0;
        };
        # 电量 ✅
        battery = {
          interval = 30;
          states = {
            good = 90;
            warning = 40;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          # format-charging = " {capacity}%";
          # format-plugged = " {capacity}%";
          format-alt = "{icon} {capacity}% {time}";
          format-icons = {
            default = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            charging = [
              "󰢟"
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
          };
          tooltip = true;
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
              type = "audio-out";
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
          ignore = [
            {
              type = "audio-in";
              name = "cava";
            }
            {
              type = "screenshare";
              name = "obs";
            }
          ];
        };
        # 电源 ✅
        "custom/power" = {
          format = "⏻";
          on-click = "${pkgs.wlogout}/bin/wlogout -b 3";
          # on-click = "${pkgs.wleave}/bin/wleave";
          # on-click = "wlogout -b 2";
          tooltip = false;
        };
        "custom/screen#toolbox" = {
          format = "🎯";
          tooltip = false;
          menu = "on-click";
          menu-file = "${config.xdg.configHome}/waybar/popup/screenshot-toolbox.xml";
          menu-actions = {
            "screen-color-picker" = "/bin/pkill -SIGUSR1 ie-r";
            "screen-color-history" = "/bin/pkill -SIGUSR2 ie-r";
            "screen-color-chooser" =
              "/bin/pkill kcolorchooser || ${pkgs.kdePackages.kcolorchooser}/bin/kcolorchooser";
            "screen-recorder" = "${pkgs.hvn}/bin/hvn-runner-flatpak io.github.seadve.Kooha";
            "ocr" = "${wme.misc.screenshot} -m ocr";
            "screen-pixel-measure" = "${wme.misc.screenshot} -m pixel-measure";
            "screenshot-window" = "${wme.misc.screenshot} -m window";
            "screenshot-fullscreen" = "${wme.misc.screenshot} -m fullscreen";
            "screenshot-region" = "${wme.misc.screenshot} -m region";
            "screenshot-window-annotate" = "${wme.misc.screenshot} -m window-annotate";
            "screenshot-fullscreen-annotate" = "${wme.misc.screenshot} -m fullscreen-annotate";
            "screenshot-region-annotate" = "${wme.misc.screenshot} -m region-annotate";
            "screenshot-scroll" = "${wme.misc.screenshot} -m scroll";
            "screenshot-scroll-preview" = "${wme.misc.screenshot} -m scroll-preview";
          };
        };
      };
    };
    style = builtins.readFile ./style.gtk.css;
    # style = null;
  };
  # create the config file for the toolbox menu
  xdg.configFile = {
    "waybar/popup" = {
      source = ./popup;
      recursive = true;
    };
  };
}
