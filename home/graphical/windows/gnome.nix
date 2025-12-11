{ config, lib, pkgs, ... }: 
{
  imports = [
    ./gnome-dconf.nix
  ];

  home.packages = with pkgs;[
    # gnome-shell-extensions
    gnome-tweaks
  ];
}