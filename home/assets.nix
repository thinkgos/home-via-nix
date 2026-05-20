{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.dataFile = {
    # 壁纸 (资源来自外部 home-assets 仓库)
    "wallpapers" = {
      source = "${pkgs.home-assets}/wallpapers";
      recursive = true;
    };
    "backgrounds" = {
      source = "${pkgs.home-assets}/wallpapers";
      recursive = true;
    };
  };
}
