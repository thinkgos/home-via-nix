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
    ++ lib.optional (customize.graphics.window == "gnome") ./gnome
    ++ lib.optional (customize.graphics.window == "hyprland") ./hyprland;

  home.sessionVariables = {
    BAT_PAGER = "less -r";
    TMPDIR = "$HOME/.cache/tmp";
  };
}
