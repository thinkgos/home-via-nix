{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#experimental
  async_find_enabled = false; # 是否使用改进的查找实现, 在大输出搜索时保持 UI 响应 (默认: false)
}
