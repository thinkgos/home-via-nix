{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 空闲管理
  # https://wiki.hypr.land/Hypr-Ecosystem/hypridle/
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
        # unlock_cmd = "loginctl unlock-session"; # kills hyprlock when unlocking (this is always run when "loginctl unlock-session" is called)
        before_sleep_cmd = "loginctl lock-session"; # ensures that the session is locked before going to sleep
        after_sleep_cmd = " hyprctl dispatch dpms on"; # turn of screen after sleep (not strictly necessary, but just in case)
        # 是否忽略来自 Firefox/Steam 等应用的"禁止休眠"请求
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
        ignore_wayland_inhibit = false;
      };
      listener = [
        {
          # timeout = 10; # 10s 测试
          timeout = 300; # 5m
          on-timeout = ''notify-send " You are idle!"'';
          on-resume = ''notify-send " Welcome Back" " Enjoy !!!"'';
        }
        {
          timeout = 600; # 10m
          # BUG: 键盘背光没法控制, 没有找到设备名. HDMI 不能用此方式, 需要用ddcutil
          on-timeout = "brightnessctl -s -d *backlight* set 10"; # turn down screen backlight.
          on-resume = "brightnessctl -r -d *backlight*"; # resume screen backlight.
        }
        {
          timeout = 900; # 15m
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
          # on-resume = ''notify-send " System Unlocked!"'';
        }
        {
          timeout = 930; # 15m30s
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r -d *backlight*"; # screen on when activity is detected after timeout has fired.
        }
        # 默认不挂起
        # {
        #   timeout = 1800; # 30min
        #   on-timeout = "systemctl suspend"; # suspend pc
        #   # on-resume = ''notify-send " System Resumed!"'';
        # }
      ];
    };
  };
}
