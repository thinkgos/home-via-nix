{
  config,
  lib,
  pkgs,
  ...
}:
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      package = pkgs.whitesur-gtk-theme; # MacOS like theme for all gtk based desktops
      name = "WhiteSur-Dark";
    };
    cursorTheme = {
      package = pkgs.whitesur-cursors; # X-cursor theme inspired by macOS and based on capitaine-cursors
      name = "WhiteSur-cursors";
      size = 24;
    };
    iconTheme = {
      package = pkgs.whitesur-icon-theme; # MacOS Big Sur style icon theme for linux desktops
      name = "WhiteSur-dark";
    };
    font = {
      package = pkgs.inter;
      name = "Inter";
      size = 11;
    };
  };
}
