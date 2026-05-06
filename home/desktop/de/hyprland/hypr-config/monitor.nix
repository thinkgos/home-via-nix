{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Hyprland 窗口
  wayland.windowManager.hyprland.settings.monitor = [
    "${customize.desktop.monitor-primary}, preferred, auto, 1"
  ]
  ++ (lib.optionals (customize.desktop.monitor-primary != "") [
    "${customize.desktop.monitor-secondary}, preferred, auto-left, 1"
  ]);
}
