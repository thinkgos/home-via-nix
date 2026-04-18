{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 窗口
  wayland.windowManager.hyprland.settings.windowrule = [
    # 计算器
    "float on, size 300 400, move (monitor_w-300)*0.5 100, match:class qalculate-gtk"
  ];
}
