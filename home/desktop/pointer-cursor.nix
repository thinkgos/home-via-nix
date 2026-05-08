{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  home.pointerCursor = {
    enable = true;
    package = customize.cursor.package;
    name = customize.cursor.name;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = customize.desktop.window == "hyprland";
  };
}
