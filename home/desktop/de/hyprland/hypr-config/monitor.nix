{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Hyprland 显示器 ✅
  wayland.windowManager.hyprland.settings.monitor = [
    {
      output = customize.desktop.monitor-primary;
      mode = "preferred";
      position = "auto";
      scale = 1;
    }
  ]
  ++ (lib.optionals (customize.desktop.monitor-primary != "") [
    {
      output = customize.desktop.monitor-secondary;
      mode = "preferred";
      position = "auto-left";
      scale = 1;
    }
  ]);
}
