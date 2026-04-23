{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://wiki.hypr.land/Plugins/Using-Plugins/
  # https://hypr.land/plugins/

  # https://github.com/zjeffer/split-monitor-workspaces

  # 插件与hyprland版本不一致
  wayland.windowManager.hyprland.plugins = with pkgs; [
    # hyprlandPlugins.hyprexpo
  ];
}
