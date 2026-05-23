{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 空闲管理
  imports =
    [ ]
    ++ lib.optional (customize.desktop.window == "hyprland") ./hypridle.nix
    ++ lib.optional (customize.desktop.window == "niri") ./swayidle.nix;
}
