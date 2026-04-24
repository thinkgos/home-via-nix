{
  config,
  lib,
  pkgs,
  extra-pkgs,
  ...
}:
{
  # https://wiki.hypr.land/Plugins/Using-Plugins/
  # https://hypr.land/plugins/

  # https://github.com/shezdy/hyprsplit

  wayland.windowManager.hyprland = {
    plugins = [
      # hyprlandPlugins.hyprexpo
      extra-pkgs.hyprsplit
    ];
    settings.plugin = {
      hyprsplit = {
        num_workspaces = 4;
      };
    };
  };
}
