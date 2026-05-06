{
  config,
  lib,
  pkgs,
  extra-pkgs,
  customize,
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
        monitor_priority =
          "${customize.desktop.monitor-primary}"
          + lib.optionalString (
            customize.desktop.monitor-secondary != ""
          ) ", ${customize.desktop.monitor-secondary}";
      };
    };
  };
}
