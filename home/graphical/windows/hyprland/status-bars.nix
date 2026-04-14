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
        height = 32;
        spacing = 8;
        # margin = "0";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
          "cpu"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "network"
          "pulseaudio"
          "battery"
          # "custom/notification"
        ];

        # 左侧模块

        # 工作区
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
        # 窗口
        "hyprland/window" = {
          format = "👉 {}";
          max-length = 40;
          separate-outputs = true;
        };
        # cpu
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
        };

        # 中间模块

        # 时钟
        clock = {
          "format" = "{:%H:%M}  ";
          "format-alt" = "{:%A, %B %d, %Y (%R)}  ";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-scroll-up" = "tz_up";
            "on-scroll-down" = "tz_down";
            # "on-scroll-up" = "shift_up";
            # "on-scroll-down" = "shift_down";
          };
        };

        # 左侧模块

        # 托盘
        tray = {
          spacing = 8;
        };
        # network = {
        #   format-wifi = "  {signalStrength}%";
        #   format-ethernet = " ";
        #   format-disconnected = "⚠ ";
        #   tooltip-format = "{ifname}: {ipaddr}/{cidr}\n{essid} ({signalStrength}%)";
        # };
        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "{icon}";
          "format-ethernet" = "󰌘";
          "format-disconnected" = "󰌙";
          "tooltip-format" = "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
          "format-linked" = "󰈁 {ifname} (No IP)";
          "tooltip-format-wifi" = "{essid} {icon} {signalStrength}%";
          "tooltip-format-ethernet" = "{ifname} 󰌘";
          "tooltip-format-disconnected" = "󰌙 Disconnected";
          "max-length" = 30;
          "format-icons" = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          # "on-click-right" = "$HOME/.config/hypr/scripts/WaybarScripts.sh --nmtui";
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

        #   pulseaudio = {
        #     format = "{icon} {volume}%";
        #     format-muted = "  muted";
        #     format-icons = {
        #       default = [
        #         " "
        #         " "
        #         " "
        #       ];
        #     };
        #     on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        #   };

        #   battery = {
        #     format = "{icon} {capacity}%";
        #     format-charging = " {capacity}%";
        #     format-icons = [
        #       " "
        #       " "
        #       " "
        #       " "
        #       " "
        #     ];
        #     states = {
        #       warning = 30;
        #       critical = 15;
        #     };
        #   };

        #   "custom/notification" = {
        #     format = " ";
        #     on-click = "swaync-client -t -sw";
        #     tooltip = false;
        #   };
      };
    };
    style = builtins.readFile ./assets/waybar/style.gtk.css;
  };
}
