{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  attrs = customize.desktop.attrs;
in
{
  # Hyprland 窗口
  wayland.windowManager.hyprland.settings.monitor = [
    "${attrs.monitor-primary}, preferred, auto, 1"
  ]
  ++ (lib.optionals (attrs.monitor-primary != "") [
    "${attrs.monitor-secondary}, preferred, auto-left, 1"
  ]);
}
