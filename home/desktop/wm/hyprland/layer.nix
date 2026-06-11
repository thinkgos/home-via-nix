{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 层规则
  wayland.windowManager.hyprland.settings.layer_rule = [
    {
      match.namespace = "waybar";
      blur = true;
    }
    {
      match.namespace = "wofi";
      blur = true;
      ignore_alpha = 0.5;
    }
    {
      match.namespace = "rofi";
      blur = true;
      ignore_alpha = 0.5;
    }
    {
      match.namespace = "vicinae";
      blur = true;
      ignore_alpha = 0;
    }
  ];
}
