{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
pkgs.callPackage ./${customize.desktop.window} { }
