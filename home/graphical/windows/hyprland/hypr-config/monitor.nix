{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  attrs = customize.graphics.attrs;
in
{
  # Hyprland 窗口
  wayland.windowManager.hyprland.settings.monitor = [
    "${attrs.monitor-primary}, preferred, auto, 1"
    "${attrs.monitor-secondary}, preferred, auto-left, 1"
  ];
}
