{
  config,
  lib,
  pkgs,
  ...
}:
{
  # rofi
  # https://davatorium.github.io/rofi/
  # https://github.com/davatorium/rofi/wiki
  home.packages = [ pkgs.rofi ];

  xdg.configFile = {
    "rofi/themes" = {
      source = ./themes;
      recursive = true;
    };
    "rofi/config.rasi".source = ./config.rasi;
  };
}
