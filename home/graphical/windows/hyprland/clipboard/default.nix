{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 剪贴板
  # https://wiki.hypr.land/Useful-Utilities/Clipboard-Managers/
  services.wl-clip-persist = {
    enable = true;
  };
}
