{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    # ./wayvnc.nix
  ]
  ++ lib.optional (customize.window == "gnome") ./gnome
  ++ lib.optional (customize.window == "hyprland") ./hyprland;
}
