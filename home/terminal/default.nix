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
    ./password-store.nix
    ./github.nix
    ./ansible.nix
  ];
}
