{ config, lib, pkgs, customize, ... }: 
{
  imports = [
    ./i18n.nix
    ./shell
    ./editor
    ./devtools
  ]
  ++ lib.optional (customize.window == "hyprland") ./windows/hyprland.nix
  ++ lib.optional (customize.window == "gnome") ./windows/gnome.nix;

  xdg = {
    enable = true;
    mime.enable = true;
  };

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "redisinsight"
      "vscode"
    ];
  };

  home.packages = with pkgs;[
    clash-verge-rev # clash代理
    grim            # 截图工具, 配合flameshot使用
    localsend       # 局域网文件传输工具
    mission-center  # 监控您的CPU,内存,磁盘,网络和GPU使用情况
    vlc             # 多媒体播放器
    uget            # 下载工具
  ];

  programs = {
    # 邮件客户端
    thunderbird = {
      enable = true;
      profiles = {};
    };
  };
  services = {
    # 截图工具
    flameshot = {
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
  };
}