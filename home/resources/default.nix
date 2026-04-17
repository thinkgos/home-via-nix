{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    "${config.xdg.dataHome}/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
    "${config.xdg.dataHome}/backgrounds" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
