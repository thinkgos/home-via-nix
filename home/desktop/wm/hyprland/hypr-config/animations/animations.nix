{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 动画
  # https://wiki.hypr.land/Configuring/Animations/
  # https://github.com/LinuxBeginnings/Hyprland-Dots/tree/main/config/hypr/animations
  imports = [
    # ./END-4.nix
    ./HYDE-dynamic.nix
    # ./HYDE-optimized.nix
    # ./Mahaveer-1.nix
    # ./ML4W-fast.nix
    # ./ML4W-moving.nix
  ];

  # 试验配置
  # wayland.windowManager.hyprland.settings.animations = {
  #   enabled = true;

  #   bezier = [
  #     # 模拟玻璃碎裂散开：起始极快，结尾带有强烈的抖动和扩散感
  #     "glass_shatter, 0.95, 0.05, 0.79, 0.04"
  #     # 模拟碎片聚拢：从极远处瞬间加速收缩，带有回弹
  #     "glass_assemble, 0.21, 1.25, 0.3, 1.15"
  #     # 线性曲线，用于边框
  #     "linear, 0, 0, 1, 1"
  #   ];

  #   animation = [
  #     # 打开：碎片聚拢 (使用 popin 并配合回弹曲线，感觉像碎片聚合成窗口)
  #     "windowsIn, 1, 4, glass_assemble, popin 10%"

  #     # 关闭：玻璃破碎 (使用 slide 并配合极端的倾斜/缩放感)
  #     # 注：Hyprland 暂不支持真正的粒子化，这里用极快的 slide + fade 模拟散去
  #     "windowsOut, 1, 3, glass_shatter, slide"

  #     # 窗口移动：保持灵动感
  #     "windowsMove, 1, 4, glass_assemble, slide"

  #     # 其他基础配置
  #     "border, 1, 2, default"
  #     "fade, 1, 3, default"
  #     "workspaces, 1, 5, glass_assemble, slidefade 20%"
  #   ];
  # };
}
