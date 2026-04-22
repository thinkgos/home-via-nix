{
  config,
  lib,
  pkgs,
  ...
}:
let
  # https://noogle.dev/f/builtins/fetchGit/
  home-assets = builtins.fetchGit {
    url = "git@github.com:thinkgos/home-via-nix-assets.git";
    ref = "main";
    rev = "2842139186278f332497dc7dd105714a698b6af2";
    lfs = true;
  };
in
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
  };
}
