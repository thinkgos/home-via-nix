{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    # 壁纸: https://wallhaven.cc/
    "${config.xdg.dataHome}/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
    "${config.xdg.dataHome}/backgrounds" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
