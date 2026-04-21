{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 窗口
  wayland.windowManager.hyprland.settings.monitor = [
    ", preferred, auto, 1"
  ];
}