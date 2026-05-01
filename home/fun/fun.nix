{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    termusic # 音乐播放器tui
    cmus # 音乐播放器tui
  ];
}
