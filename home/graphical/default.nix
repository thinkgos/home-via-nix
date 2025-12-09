{ config, lib, pkgs, ... }: 
{
  imports = [
    ./shell
  ];

  home.packages = with pkgs;[
    dbeaver-bin
  ];
}