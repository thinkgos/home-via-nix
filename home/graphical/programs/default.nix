{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./wayvnc.nix
    ./lan-mouse.nix
  ];
}
