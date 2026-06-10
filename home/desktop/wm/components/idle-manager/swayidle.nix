{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 空闲管理
  # https://github.com/swaywm/swayidle
  services.swayidle = {
    enable = true;
    # extraArgs = [];
    events = {
      lock = "/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock"; # avoid starting multiple hyprlock instances.
      # unlock = "loginctl unlock-session"; # kills hyprlock when unlocking (this is always run when "loginctl unlock-session" is called)
      before-sleep = "/bin/loginctl lock-session"; # ensures that the session is locked before going to sleep
      after-resume = "${pkgs.niri-unstable}/bin/niri msg action power-on-monitors"; # turn on screen after sleep (not strictly necessary, but just in case)
    };
    timeouts = [
      {
        timeout = 300; # 5m
        # timeout = 30; # 30s(测试)
        command = ''/bin/notify-send " You are idle!"'';
        resumeCommand = ''/bin/notify-send " Welcome Back" " Enjoy !!!"'';
      }
      {
        timeout = 600; # 10m
        # timeout = 45; # 45s(测试)
        # BUG: 键盘背光没法控制, 没有找到设备名. HDMI 不能用此方式, 需要用ddcutil
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s -d *backlight* set 10"; # turn down screen backlight.
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r -d *backlight*"; # resume screen backlight.
      }
      {
        timeout = 900; # 15m
        # timeout = 60; # 60s(测试)
        command = "/bin/loginctl lock-session"; # lock screen when timeout has passed
        resumeCommand = ''/bin/notify-send " Welcome" " Enjoy !!!"'';
      }
      {
        timeout = 910; # 15m10s
        # timeout = 75; # 75s(测试)
        command = "${pkgs.niri-unstable}/bin/niri msg action power-off-monitors"; # screen off when timeout has passed
        resumeCommand = "${pkgs.niri-unstable}/bin/niri msg action power-on-monitors && ${pkgs.brightnessctl}/bin/brightnessctl -r -d *backlight*"; # screen on when activity is detected after timeout has fired.
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
