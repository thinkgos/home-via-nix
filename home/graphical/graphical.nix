{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./pointer-cursor.nix
    ./i18n.nix
    ./password-store.nix
    ./accouts.nix
    ./email.nix
    ./screenshot.nix
    ./assets.nix
    ./shell/shell.nix
    ./editor/editor.nix
    ./devtools/devtools.nix
    ./programs/programs.nix
    ./windows/windows.nix
  ];

  nixpkgs.config = {
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "albert"
      ];
  };

  home.packages = with pkgs; [
    # 从系统安装
    # chrome          # 浏览器, https://www.google.com/intl/zh-CN/chrome/
    # clash-verge-rev # clash代理, https://github.com/clash-verge-rev/clash-verge-rev
    # virtualbox      # 虚拟机, https://www.virtualbox.org
    # wireshark       # 网络分析工具, https://www.wireshark.org
    # vnc-viewer      # VNC客户端, https://www.realvnc.com/en/connect/download/viewer/

    zenity # 用于命令行或脚本弹出对话框
    slurp # wayland区域选择
    wl-clipboard # wayland剪贴板工具
    localsend # 局域网文件传输工具
    mission-center # 监控您的CPU,内存,磁盘,网络和GPU使用情况
    vlc # 多媒体播放器
    uget # 下载工具

    nixd
    nil
    nixfmt
    nixfmt-tree
  ];
}
