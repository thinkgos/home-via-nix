{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 壁纸
  imports = [
    ./awww.nix
    ./phonto.nix
  ]
  ++ lib.optional (customize.desktop.window == "niri") ./wpaperd.nix;
}
