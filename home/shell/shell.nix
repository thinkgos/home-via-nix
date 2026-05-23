{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zsh.nix
    ./nushell/nushell.nix
    # ./bash.nix
  ];
}
