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
    ./password-store.nix
    ./github.nix
    ./ansible.nix
  ];
}
