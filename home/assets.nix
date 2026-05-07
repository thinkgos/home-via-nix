{
  config,
  lib,
  pkgs,
  ...
}:
let
  # https://noogle.dev/f/builtins/fetchGit/
  home-assets = builtins.fetchGit {
    url = "https://github.com/thinkgos/home-via-nix-assets.git";
    ref = "main";
    rev = "2b4cf01561f3c73463ec683b2b12970986836d81";
    lfs = true;
  };
in
{
  home.packages = [
    pkgs.papirus-icon-theme # Pixel perfect icon theme for Linux
  ];
  xdg.dataFile = {
    # 壁纸 (资源来自外部 home-assets 仓库)
    "wallpapers" = {
      source = "${home-assets}/wallpapers";
      recursive = true;
    };
    "backgrounds" = {
      source = "${home-assets}/wallpapers";
      recursive = true;
    };
  };
}
