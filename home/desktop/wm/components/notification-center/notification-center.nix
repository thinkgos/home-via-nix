{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 通知中心
  imports = [
    ./swaync/swaync.nix
  ];
}
