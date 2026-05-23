{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 剪贴板
  # services.wl-clip-persist = {
  #   enable = true;
  # };
  services.cliphist = {
    enable = true;
    allowImages = true;
    clipboardPackage = pkgs.wl-clipboard;
    extraOptions = [ ];
  };
}
