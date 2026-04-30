{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    resvg # svg rendering
    poppler # pdf rendering
    _7zz # 7-zip archiver utility
    imagemagick # image suite
    ueberzugpp # hack image for terminal emulators
    baobab # 磁盘占用分析工具
    gnome-disk-utility # 磁盘管理工具
    kdePackages.okular # pdf viewer

    # https://github.com/Huanshere/VideoLingo 全自动搬运
    aegisub # 字幕编辑器 https://aegisub.org/zh-cn/docs/latest/main_page/
    subtitlecomposer # 字幕编辑器 https://subtitlecomposer.kde.org/
    subtitleedit # 字幕编辑器 https://nikse.dk/subtitleedit
    ffsubsync # 字幕同步工具 https://github.com/smacke/ffsubsync
    python313Packages.subliminal # 字幕下载工具 https://github.com/Diaoul/subliminal
  ];
  imports = [
    ./lan-mouse.nix
    ./obs-studio.nix
    ./remote-desktop.nix
  ];
}
