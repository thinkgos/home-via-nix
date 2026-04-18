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
    ./password-store.nix
    ./git.nix
    ./github.nix
    ./ansible.nix
  ];
}
