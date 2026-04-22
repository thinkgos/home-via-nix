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
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 300; # 5min.
          # BUG: 键盘背光没法控制, 没有找到设备名.
          on-timeout = "brightnessctl -s set 0"; # turn off keyboard backlight.
          on-resume = "brightnessctl -r"; # turn on keyboard backlight.
        }
        {
          timeout = 600; # 10min.
          on-timeout = ''notify-send " You are idle!"'';
          on-resume = ''notify-send " Welcome Back" " Enjoy !!!"'';
        }
        {
          timeout = 900; # 15min
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
          # on-resume = ''notify-send " System Unlocked!"'';
        }
        {
          timeout = 1200; # 20min
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r"; # screen on when activity is detected after timeout has fired.
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
