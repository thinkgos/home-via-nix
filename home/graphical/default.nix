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

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "redisinsight"
      "vscode"
      "albert"
    ];
  };

  home.packages = with pkgs;[
    # 从系统安装
    # chrome          # 浏览器, https://www.google.com/intl/zh-CN/chrome/
    # clash-verge-rev # clash代理, https://github.com/clash-verge-rev/clash-verge-rev
    # virtualbox      # 虚拟机, https://www.virtualbox.org
    # wireshark       # 网络分析工具, https://www.wireshark.org
    # vnc-viewer      # VNC客户端, https://www.realvnc.com/en/connect/download/viewer/

    grim            # 截图工具, 配合flameshot使用
    localsend       # 局域网文件传输工具
    mission-center  # 监控您的CPU,内存,磁盘,网络和GPU使用情况
    vlc             # 多媒体播放器
    uget            # 下载工具
    albert          # 启动器(可选替代ulauncher)
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