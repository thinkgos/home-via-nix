{ config, lib, pkgs, ... }: 
{
  imports = [
    ./gnome-dconf.nix
    ./gnome-shell-extensions.nix
  ];

  home.packages = with pkgs;[
    whitesur-gtk-theme  # MacOS like theme for all gtk based desktops
    whitesur-icon-theme # MacOS Big Sur style icon theme for linux desktops
    whitesur-cursors    # X-cursor theme inspired by macOS and based on capitaine-cursors
  ];
}