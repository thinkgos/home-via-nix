{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://github.com/ErikReider/SwayOSD
  services.swayosd = {
    enable = true;
    topMargin = 0.15;
    stylePath = "${config.xdg.configHome}/swayosd/style.css";
  };
  xdg.configFile."swayosd/style.css".source = ./style.gtk.css;
}
