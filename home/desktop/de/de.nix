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
    ++ lib.optional (customize.desktop.window == "gnome") ./gnome/gnome.nix
    ++ lib.optional (customize.desktop.window == "hyprland") ./hyprland/hyprland.nix
    ++ lib.optional (customize.desktop.window == "niri") ./niri/niri.nix;

}
