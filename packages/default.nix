{
  config,
  lib,
  pkgs,
  ...
}:
{
  ohlib = pkgs.callPackage ./ohlib { };
  ohshell = pkgs.callPackage ./ohshell { };
  home-assets = pkgs.callPackage ./home-assets { };
  hvn = pkgs.callPackage ./hvn { };
}
