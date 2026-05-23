{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkImport = path: import path { inherit config lib pkgs; };
in
pkgs.symlinkJoin {
  name = "hwn";
  paths = [
    (mkImport ./picker/bt-picker-wallpaper)
    (mkImport ./popup/bt-popup-clipboard)
    (mkImport ./popup/bt-popup-dropdown-terminal)
  ];
}
