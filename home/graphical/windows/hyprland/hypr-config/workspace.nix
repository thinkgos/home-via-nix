{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 工作空间
  wayland.windowManager.hyprland.settings.workspace = [
    "r[1-4], persistent:true"
    "r[1-2], layout:scrolling"
    "3, layout:dwindle"
    "4, on-created-empty:$launchTerminal"
  ];
}
