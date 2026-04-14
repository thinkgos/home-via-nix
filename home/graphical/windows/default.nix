{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports =
    [ ]
    ++ lib.optional (customize.window == "gnome") ./gnome
    ++ lib.optional (customize.window == "hyprland") ./hyprland;
}
