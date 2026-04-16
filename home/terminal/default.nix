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
    ./ai
    ./git.nix
    ./github.nix
    ./ansible.nix
  ];
}
