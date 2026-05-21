{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 蓝光保护
  imports = [
    # ./hyprsunset.nix
    ./wlsunset.nix
  ];
}
