{
  config,
  lib,
  pkgs,
  ...
}:
{
  # wofi 极致简约原生
  # https://cloudninja.pw/docs/wofi.html
  programs.wofi = {
    enable = true;
    settings = {
      # man 5 wofi
      show = "drun";
      location = "center";
      anchor = "center";
      width = "40%";
      height = "40%";
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";

      prompt = "Search...";
      filter_rate = 100;

      allow_images = true;
      allow_markup = true;
      no_actions = true;
      insensitive = true;
      gtk_dark = true;
    };
    style = builtins.readFile ./style.gtk.css;
  };
}
