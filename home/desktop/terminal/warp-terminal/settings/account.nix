{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#account
  is_settings_sync_enabled = true; # 设置是否通过云端跨设备同步 (默认: false)
}
