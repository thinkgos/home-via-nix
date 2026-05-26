{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 工作空间 ✅
  wayland.windowManager.hyprland.settings.workspace_rule = [
    {
      workspace = "r[1-2]";
      layout = "dwindle";
    }
    {
      workspace = "3";
      layout = "dwindle";
    }
    {
      workspace = "4";
      on_created_empty = "${pkgs.alacritty}/bin/alacritty";
    }
  ];
}
