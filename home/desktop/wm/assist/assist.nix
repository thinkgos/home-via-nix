{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./swayosd/swayosd.nix
  ];
}
