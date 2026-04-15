{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://wiki.hypr.land/Plugins/Using-Plugins/
  # https://hypr.land/plugins/
  wayland.windowManager.hyprland.plugins = with pkgs; [
    hyprlandPlugins.hyprexpo
  ];
}
