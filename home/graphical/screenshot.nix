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
  programs.satty = lib.mkIf (customize.graphics.window == "hyprland") {
    enable = true;
    # https://github.com/Satty-org/Satty
    settings = {
    };
  };

  # 截图工具
  services.flameshot = lib.mkIf (customize.graphics.window == "gnome") {
    enable = true;
    # https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
    settings = {
      General = {
        showStartupLaunchMessage = false;
        disabledTrayIcon = false;
        autoCloseIdleDaemon = true;
        useGrimAdapter = false;
        contrastOpacity = 188;
      };
    };
  };
}
