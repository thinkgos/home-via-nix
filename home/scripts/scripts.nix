{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.ohshell.fzf-preview
    pkgs.ohshell.git-submodule
  ];
}
