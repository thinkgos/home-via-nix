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
    rev = "3c96529cf08aaebeab947acf7d83416be9ddb240";
    lfs = true;
  };
in
{
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
