{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./wlogout/wlogout.nix
    ./wleave/wleave.nix
  ];
}
