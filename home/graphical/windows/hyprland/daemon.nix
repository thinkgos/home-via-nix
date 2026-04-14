{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 守护进程

  services = {
    # https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent/
    hyprpolkitagent = {
      enable = true;
    };
    # 剪贴板
    wl-clip-persist = {
      enable = true;
    };
  };
}
