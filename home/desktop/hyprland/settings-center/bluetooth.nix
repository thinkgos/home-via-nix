{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 蓝牙组件
  services.blueman-applet = {
    enable = true;
    package = pkgs.blueman;
  };
}
