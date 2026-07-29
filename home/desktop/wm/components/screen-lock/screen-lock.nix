{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 屏幕锁定
  imports = [
    ./swaylock.nix
  ];
}
