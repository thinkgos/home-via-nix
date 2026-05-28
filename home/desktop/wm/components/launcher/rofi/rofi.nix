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
    "rofi/config.rasi".source = ./config/config.rasi;
    "rofi/config-wallpaper.rasi".source = ./config/config-wallpaper.rasi;
    "rofi/config-shortcut.rasi".source = ./config/config-shortcut.rasi;
  };
}
