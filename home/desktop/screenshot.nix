{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{

  home.packages = with pkgs; [
    grim # 截图工具
  ];

  # 截图工具
  programs.satty = {
    enable = customize.desktop.window == "hyprland";
    # https://github.com/Satty-org/Satty
    settings = {
    };
  };

  # 截图工具
  services.flameshot = {
    enable = customize.desktop.window == "gnome";
    # https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
    settings = {
      General = {
        showStartupLaunchMessage = false;
        disabledTrayIcon = false;
        autoCloseIdleDaemon = true;
        contrastOpacity = 188;
      };
    };
  };
}
