{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 蓝光保护
  imports = [
    ./wlsunset.nix
  ];
}
