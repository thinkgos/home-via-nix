{ config, lib, pkgs, ... }: 
{
  imports = [
    ./gnome-dconf.nix
  ];

  home.packages = with pkgs;[
  ];
}