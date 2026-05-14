{
  config,
  lib,
  pkgs,
  ...
}:
{
  # libepoxy
  # cava
  # https://github.com/karlstav/cava
  programs.cava = {
    enable = true;
    package = pkgs.cava.override { withSDL2 = true; };
    # https://github.com/karlstav/cava/blob/master/example_files/config
    # settings = {};
  };
  xdg.configFile = {
    "cava" = {
      source = ./conf;
      recursive = true;
    };
  };
}
