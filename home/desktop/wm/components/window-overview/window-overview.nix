{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 窗口概览
  imports = [ ] ++ lib.optional (customize.desktop.window == "hyprland") ./hyprshell.nix;
}
