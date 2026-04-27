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
    ++ lib.optional (customize.graphics.window == "gnome") ./gnome/gnome.nix
    ++ lib.optional (customize.graphics.window == "hyprland") ./hyprland/hyprland.nix;

  home.sessionVariables = {
    BAT_PAGER = "less -r";
    TMPDIR = "$HOME/.cache/tmp";
  };
}
