{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./assets/wezterm.lua;
  };
}
