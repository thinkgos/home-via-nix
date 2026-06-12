{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 空闲管理
  # https://github.com/swaywm/swayidle
  services.swayidle = {
    enable = true;
    # extraArgs = [];
    events = {
      lock =
        "/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock & /bin/sleep 1 && "
        + (
          if (customize.desktop.window == "hyprland") then
            "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'"
          else if (customize.desktop.window == "niri") then
            "${pkgs.niri}/bin/niri msg action power-off-monitors"
          else
            ''/bin/notify-send "[swayidle] lock not supported"''
        );
      unlock = "/bin/loginctl unlock-session";
      before-sleep = "/bin/loginctl lock-session";
      after-resume =
        if (customize.desktop.window == "hyprland") then
          "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'"
        else if (customize.desktop.window == "niri") then
          "${pkgs.niri}/bin/niri msg action power-on-monitors"
        else
          ''/bin/notify-send "[swayidle] after-resume not supported"'';
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
        # resumeCommand = "";
      }
    ];
  };
}
