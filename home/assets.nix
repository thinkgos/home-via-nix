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
    rev = "71f346c1e13a0b6279409bcef1371338a4628487";
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
