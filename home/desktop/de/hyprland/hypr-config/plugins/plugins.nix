{
  config,
  lib,
  pkgs,
  extra-pkgs,
  customize,
  ...
}:
let
  attrs = customize.desktop.attrs;
in
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
        monitor_priority = "${attrs.monitor-primary}" + lib.optionalString (attrs.monitor-secondary != "") ", ${attrs.monitor-secondary}";
      };
    };
  };
}
