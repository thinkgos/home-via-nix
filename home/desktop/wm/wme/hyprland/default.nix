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
  workspace = {
    focus-last = "${localpkgs.focus-last-workspace}/bin/wme-focus-last-workspace";
  };
  window = {
    move-to-last-workspace = "${localpkgs.window-move-to-last-workspace}/bin/wme-window-move-to-last-workspace";
  };
  misc = {
    dropdown-terminal = "${localpkgs.dropdown-terminal}/bin/wme-dropdown-terminal";
  };
  pkgs = {
    wl-active-window = localpkgs.wl-active-window;
  };
}
