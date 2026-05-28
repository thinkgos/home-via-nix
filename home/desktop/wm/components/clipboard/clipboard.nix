{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 剪贴板
  # 由 vicinae 接管剪贴板功能
  # services.wl-clip-persist = {
  #   enable = true;
  # };
  # services.cliphist = {
  #   enable = true;
  #   allowImages = true;
  #   clipboardPackage = pkgs.wl-clipboard;
  #   extraOptions = [ ];
  # };
}
