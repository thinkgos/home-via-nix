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
      lock = "/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock & /bin/sleep 1 && ${pkgs.niri-unstable}/bin/niri msg action power-off-monitors"; # avoid starting multiple hyprlock instances.
      unlock = "/bin/loginctl unlock-session"; # kills hyprlock when unlocking (this is always run when "loginctl unlock-session" is called)
      before-sleep = "/bin/loginctl lock-session"; # ensures that the session is locked before going to sleep
      after-resume = "${pkgs.niri-unstable}/bin/niri msg action power-on-monitors"; # turn on screen after sleep (not strictly necessary, but just in case)
    };
    timeouts = [
      {
        timeout = 300; # 5m
        # timeout = 15; # 15s(测试)
        command = ''/bin/notify-send " You are idle!"'';
        resumeCommand = ''/bin/notify-send " Welcome Back" " Enjoy !!!"'';
      }
      {
        timeout = 600; # 10m
        # timeout = 30; # 30s(测试)
        # BUG: 键盘背光没法控制, 没有找到设备名. HDMI 不能用此方式, 需要用ddcutil
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s -d '*backlight*' set 10"; # turn down screen backlight.
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r -d '*backlight*'"; # resume screen backlight.
      }
      {
        timeout = 900; # 15m
        # timeout = 45; # 45s(测试)
        command = "/bin/loginctl lock-session"; # lock screen when timeout has passed
        # resumeCommand = "${pkgs.niri-unstable}/bin/niri msg action power-on-monitors";
      }
    ];
  };
}
