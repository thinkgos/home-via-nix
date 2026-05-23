{ config, lib, ... }:
final: prev:
let
  mkImport =
    path:
    import path {
      inherit config lib;
      pkgs = final;
    };
in
{
  ohlib = mkImport ./ohlib;
  ohshell = mkImport ./ohshell;
  home-assets = mkImport ./home-assets;
  hwn = mkImport ./hwn;
}
