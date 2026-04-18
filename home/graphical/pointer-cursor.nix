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
    package = pkgs.whitesur-cursors; # X-cursor theme inspired by macOS and based on capitaine-cursors
    name = "WhiteSur-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = customize.window == "hyprland";
  };
}
