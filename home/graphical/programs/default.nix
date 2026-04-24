{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./vnc.nix
    ./lan-mouse.nix
  ];
}
