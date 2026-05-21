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
    ++ lib.optional (
      customize.desktop.window == "hyprland" || customize.desktop.window == "niri"
    ) ./assist/assist.nix;
}
