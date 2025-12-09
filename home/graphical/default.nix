{ config, lib, pkgs, ... }: 
{
  imports = [
    ./shell
    ./dbeaver.nix
  ];

  xdg.enable = true;

  home.packages = with pkgs;[
  ];
}