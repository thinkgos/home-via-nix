{
  config,
  lib,
  pkgs,
  ...
}:
{
  # rofi 
  # https://davatorium.github.io/rofi/
  programs.rofi = {
    enable = true;
    settings = {

    };
  };
}
