{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    withRuby = true;
    withPython3 = true;
  };
}
