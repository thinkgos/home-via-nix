{ config, lib, pkgs, ... }: 
{
  imports = [
    ./shell
  ];

  xdg.enable = true;

  home.packages = with pkgs;[
    dbeaver-bin
    localsend
    wireshark
    vlc
  ];
}