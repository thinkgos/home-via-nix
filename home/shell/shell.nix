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

  home.shellAliases = {
    # the top level attribute names.
    # If you need to use a shell specific feature
    # then make sure to use a shell specific option
    cat = "bat -p";
    nv = "nvim";
    tf = "terraform";
    trash = "trash -v";
    cco = "claude";
  };
}
