{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 窗口切换器
  imports = [
    ./hyprshell.nix
  ];
}
