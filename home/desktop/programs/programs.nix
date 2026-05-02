{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./remote-desktop.nix
    ./lan-mouse.nix
    ./obs-studio.nix
    ./yt-dlp.nix
    ./video-edit.nix
  ];
  home.packages = with pkgs; [
    zenity # 用于命令行或脚本弹出对话框
    slurp # wayland区域选择
    wl-clipboard # wayland剪贴板工具
    mission-center # 监控您的CPU,内存,磁盘,网络和GPU使用情况
    vlc # 多媒体播放器
    uget # 下载工具
    baobab # 磁盘占用分析工具
    gnome-disk-utility # 磁盘管理工具
    kdePackages.okular # pdf viewer
    localsend # 局域网文件传输工具
  ];
}
