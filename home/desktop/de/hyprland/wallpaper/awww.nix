{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 壁纸
  # https://codeberg.org/LGFae/awww
  services.awww = {
    enable = true;
    extraArgs = [ ];
  };
}
