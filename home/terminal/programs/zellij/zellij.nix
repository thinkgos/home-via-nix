{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.zellij = {
    enable = true;
    extraConfig = builtins.readFile ./zellij.kdl;
  };
}
