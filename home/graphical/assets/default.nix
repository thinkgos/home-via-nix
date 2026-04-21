{
  config,
  lib,
  pkgs,
  home-assets,
  ...
}:
{
  home.packages = [
    pkgs.papirus-icon-theme # Pixel perfect icon theme for Linux
  ];
  home.file = {
    # 壁纸: https://wallhaven.cc/ (资源来自外部 home-assets 仓库)
    "${config.xdg.dataHome}/wallpapers" = {
      source = "${home-assets}/wallpapers";
      recursive = true;
    };
    "${config.xdg.dataHome}/backgrounds" = {
      source = "${home-assets}/wallpapers";
      recursive = true;
    };
    # icons

  };
}
