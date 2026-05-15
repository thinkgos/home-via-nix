{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./share-desktop.nix
    ./share-input.nix
    ./cava/cava.nix
    ./obs-studio.nix
    ./yt-dlp.nix
  ]
  ++ lib.optional (builtins.elem "obs-studio" customize.apps) ./obs-studio.nix
  ++ lib.optional (builtins.elem "video-clip" customize.components) ./video-clip.nix;

  home.packages =
    with pkgs;
    [
      zenity # 用于命令行或脚本弹出对话框
      slurp # wayland区域选择
      wl-clipboard # wayland剪贴板工具
      mission-center # 监控您的CPU,内存,磁盘,网络和GPU使用情况
      vlc # 多媒体播放器
      mpv # 多媒体播放器
      uget # 下载工具
      baobab # 磁盘占用分析工具
      gnome-disk-utility # 磁盘管理工具
      kdePackages.okular # pdf viewer
      kdePackages.gwenview # image viewer
      kdePackages.kcolorchooser # 颜色选择器
      localsend # 局域网文件传输工具
      drawy # 画布工具
      wayscrollshot # 滚动截图工具
    ];
}
