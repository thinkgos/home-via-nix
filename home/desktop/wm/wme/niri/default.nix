{
  config,
  lib,
  pkgs,
  ...
}:
let
  localpkgs = pkgs.callPackage ./packages { };
in
{
  pkgs = {
    wl-active-window = localpkgs.wl-active-window;
  };
}
