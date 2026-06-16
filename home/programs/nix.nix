{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nix
    nixd
    # nil
    nixfmt
    nixfmt-tree
    npins
    # fast-nix-gc
  ];
}
