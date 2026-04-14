{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 截图工具
  services.flameshot = {
    enable = true;
    # https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
    settings = {
      General = {
        showStartupLaunchMessage = false;
        disabledTrayIcon = false;
        autoCloseIdleDaemon = true;
        useGrimAdapter = true;
        contrastOpacity = 188;
      };
    };
  };
}
