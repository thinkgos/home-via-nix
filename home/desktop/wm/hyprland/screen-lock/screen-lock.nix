{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 屏幕锁定
  imports = [
    ./hyprlock.nix
    # ./swaylock.nix
  ];
}
