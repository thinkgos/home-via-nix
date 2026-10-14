{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # nix # use default nix
    nixd
    nil
    nixfmt
    nixfmt-tree
    npins
    # fast-nix-gc
  ];
}
