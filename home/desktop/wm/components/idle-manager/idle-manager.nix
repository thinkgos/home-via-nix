{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 空闲管理
  imports = [
    (if customize.desktop.window == "hyprland" then ./hypridle.nix else ./swayidle.nix)
  ];
}
