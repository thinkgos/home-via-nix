{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 截图标注
  home.packages = with pkgs; [
    grim # 截图工具
  ];

  programs.satty = {
    enable = true;
    # https://github.com/Satty-org/Satty
    settings = {
    };
  };

  services.flameshot = {
    enable = builtins.elem "flameshot" customize.components;
    # https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
    settings = {
      General = {
        showStartupLaunchMessage = false;
        disabledTrayIcon = false;
        autoCloseIdleDaemon = true;
        contrastOpacity = 188;
        savePath = "${config.home.homeDirectory}/Pictures/screenshots";
        saveAsFileExtension = ".png";
        filenamePattern = "%Y%m%d%H%M%S";
      };
    };
  };
}
