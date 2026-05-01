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

    # https://github.com/Huanshere/VideoLingo 全自动搬运
    aegisub # 字幕编辑器 https://aegisub.org/zh-cn/docs/latest/main_page/
    subtitlecomposer # 字幕编辑器 https://subtitlecomposer.kde.org/
    # subtitleedit # 字幕编辑器 https://nikse.dk/subtitleedit
    ffsubsync # 字幕同步工具 https://github.com/smacke/ffsubsync
    python313Packages.subliminal # 字幕下载工具 https://github.com/Diaoul/subliminal
  ];
}
