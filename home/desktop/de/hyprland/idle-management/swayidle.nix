{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 空闲管理
  services.swayidle = {
    enable = true;
    # extraArgs = [];
    events = {
      lock = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
      # unlock = "loginctl unlock-session"; # kills hyprlock when unlocking (this is always run when "loginctl unlock-session" is called)
      before-sleep = "loginctl lock-session"; # ensures that the session is locked before going to sleep
      after-resume = "hyprctl dispatch dpms on"; # turn of screen after sleep (not strictly necessary, but just in case)
    };
    timeouts = [
      {
        timeout = 10; # 10s 测试
        # timeout = 300; # 5m
        command = ''${pkgs.libnotify}/bin/notify-send " You are idle!"'';
        resumeCommand = ''${pkgs.libnotify}/bin/notify-send " Welcome Back" " Enjoy !!!"'';
      }
      {
        timeout = 600; # 10m
        # BUG: 键盘背光没法控制, 没有找到设备名. HDMI 不能用此方式, 需要用ddcutil
        command = "sh -c 'brightnessctl -s -d *backlight* set 10'"; # turn down screen backlight.
        resumeCommand = "sh -c 'brightnessctl -r -d *backlight*'"; # resume screen backlight.
      }
      {
        timeout = 900; # 15m
        command = "sh -c 'loginctl lock-session'"; # lock screen when timeout has passed
        # resumeCommand = ''${pkgs.libnotify}/bin/notify-send " System Unlocked!"'';
      }
      {
        timeout = 930; # 15m30s
        command = "sh -c 'hyprctl dispatch dpms off'"; # screen off when timeout has passed
        resumeCommand = "sh -c 'hyprctl dispatch dpms on && brightnessctl -r -d *backlight*'"; # screen on when activity is detected after timeout has fired.
      }
      # 默认不挂起
      # {
      #   timeout = 1800; # 30min
      #   command = "sh -c 'systemctl suspend'"; # suspend pc
      #   # resumeCommand = ''${pkgs.libnotify}/bin/notify-send " System Resumed!"'';
      # }
    ];
  };
}
