{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./shell
    ./devtools
    ./editor
    ./git.nix
  ];
}
