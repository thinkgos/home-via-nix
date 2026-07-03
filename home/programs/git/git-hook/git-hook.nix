{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./lefthook.nix
  ];
  home.packages = with pkgs; [
    pre-commit # git pre-commit hook
  ];
}
