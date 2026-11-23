{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#system
  prefer_low_power_gpu = false; # 是否优先使用集成(低功耗)GPU (默认: false)
}
