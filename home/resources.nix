{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    "${config.xdg.dataHome}/wallpapers" = {
      source = ./assets/wallpapers;
      recursive = true;
    };
    "${config.xdg.dataHome}/backgrounds" = {
      source = ./assets/wallpapers;
      recursive = true;
    };
  };
}
