{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#system
  prefer_low_power_gpu = false; # 是否优先使用集成(低功耗)GPU (默认: false)
  # preferred_graphics_backend = null; # 首选的图形后端(Windows) (默认: null)
  linux_selection_clipboard = true; # 是否使用 Linux 默认剪贴板 (默认: true)
  force_x11 = false; # 在 Linux 上是否应强制使用 X11 而不是 Wayland (默认: true)
}
