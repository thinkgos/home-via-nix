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
        lock_cmd = "/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock"; # avoid starting multiple hyprlock instances.
        # unlock_cmd = "/bin/loginctl unlock-session"; # kills hyprlock when unlocking (this is always run when "/bin/loginctl unlock-session" is called)
        before_sleep_cmd = "/bin/loginctl lock-session"; # ensures that the session is locked before going to sleep
        after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'"; # turn of screen after sleep (not strictly necessary, but just in case)
        # 是否忽略来自 Firefox/Steam 等应用的"禁止休眠"请求
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
        ignore_wayland_inhibit = false;
      };
      listener = [
        {
          timeout = 300; # 5m
          # timeout = 30; # 30s(测试)
          on-timeout = ''/bin/notify-send " You are idle!"'';
          on-resume = ''/bin/notify-send " Welcome Back" " Enjoy !!!"'';
        }
        {
          timeout = 600; # 10m
          # timeout = 45; # 45s(测试)
          # BUG: 键盘背光没法控制, 没有找到设备名. HDMI 不能用此方式, 需要用ddcutil
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s -d *backlight* set 10"; # turn down screen backlight.
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r -d *backlight*"; # resume screen backlight.
        }
        {
          timeout = 900; # 15m
          # timeout = 60; # 60s(测试)
          on-timeout = "/bin/loginctl lock-session"; # lock screen when timeout has passed
          # on-resume = ''/bin/notify-send " System Unlocked!"'';
        }
        {
          timeout = 910; # 15m10s
          # timeout = 75; # 75s(测试)
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'"; # screen off when timeout has passed
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'"; # screen on when activity is detected after timeout has fired.
        }
        # 默认不挂起
        # {
        #   timeout = 1800; # 30min
        #   on-timeout = "/bin/systemctl suspend"; # suspend pc
        #   # on-resume = ''/bin/notify-send " System Resumed!"'';
        # }
      ];
    };
  };
}
