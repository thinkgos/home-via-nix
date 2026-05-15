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
      lock = "/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock"; # avoid starting multiple hyprlock instances.
      # unlock = "loginctl unlock-session"; # kills hyprlock when unlocking (this is always run when "loginctl unlock-session" is called)
      before-sleep = "/bin/loginctl lock-session"; # ensures that the session is locked before going to sleep
      after-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on"; # turn of screen after sleep (not strictly necessary, but just in case)
    };
    timeouts = [
      {
        timeout = 300; # 5m
        command = ''/bin/notify-send " You are idle!"'';
        resumeCommand = ''/bin/notify-send " Welcome Back" " Enjoy !!!"'';
      }
      {
        timeout = 600; # 10m
        # BUG: 键盘背光没法控制, 没有找到设备名. HDMI 不能用此方式, 需要用ddcutil
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s -d *backlight* set 10"; # turn down screen backlight.
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r -d *backlight*"; # resume screen backlight.
      }
      {
        timeout = 900; # 15m
        command = "/bin/loginctl lock-session"; # lock screen when timeout has passed
        resumeCommand = ''/bin/notify-send " Welcome" " Enjoy !!!"'';
      }
      {
        timeout = 930; # 15m30s
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off"; # screen off when timeout has passed
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on && ${pkgs.brightnessctl}/bin/brightnessctl -r -d *backlight*"; # screen on when activity is detected after timeout has fired.
      }
      # 默认不挂起
      # {
      #   timeout = 1800; # 30min
      #   command = "/bin/systemctl suspend"; # suspend pc
      #   # resumeCommand = ''/bin/notify-send " System Resumed!"'';
      # }
    ];
  };
}
