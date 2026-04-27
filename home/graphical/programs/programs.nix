{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    resvg # svg rendering
    poppler # pdf rendering
    _7zz # 7-zip archiver utility
    imagemagick # image suite
    ueberzugpp # hack image for terminal emulators
  ];
  imports = [
    ./vnc.nix
    ./lan-mouse.nix
  ];
}
