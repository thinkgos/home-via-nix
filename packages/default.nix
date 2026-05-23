{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkImport =
    path:
    import path {
      inherit config lib pkgs;
    };
in
{
  ohlib = mkImport ./ohlib;
  ohshell = mkImport ./ohshell;
  home-assets = mkImport ./home-assets;
  hwn = mkImport ./hwn;
}
