{
  config,
  lib,
  pkgs,
  customize,
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
  ];
  imports = [
    ./lan-mouse.nix
    ./obs-studio.nix
  ]
  ++ lib.optional (customize.graphics.window == "hyprland") [
    ./vnc.nix
  ];
}
