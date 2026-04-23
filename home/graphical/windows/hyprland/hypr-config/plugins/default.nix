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

  # https://github.com/zjeffer/split-monitor-workspaces

  # 插件与hyprland版本不一致
  wayland.windowManager.hyprland = {
    plugins = [
      # hyprlandPlugins.hyprexpo
      extra-pkgs.split-monitor-workspaces
    ];
    settings.plugin = {
      split-monitor-workspaces = {
        count = 5;
        keep_focused = 0;
        enable_screen_sharing = 1;
        enable_notifications = 0;
      };
    };
  };
}
