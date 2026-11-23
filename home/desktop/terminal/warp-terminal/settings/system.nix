{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#system
  prefer_low_power_gpu = false; # 是否优先使用集成(低功耗)GPU (默认: false)
  # preferred_graphics_backend 未设置(null 自动选择), 可选 dx12/vulkan/gl/metal, 仅 Windows (默认: null)
  linux_selection_clipboard = true; # 是否使用 Linux 主选区(primary selection)剪贴板 (默认: true)
  force_x11 = false; # 是否强制使用 X11 而非 Wayland; false 启用原生 Wayland, 与 warp-terminal 包的 waylandSupport 对应 (默认: true)
}
