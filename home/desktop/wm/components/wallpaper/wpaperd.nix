{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 壁纸
  # https://github.com/danyspin97/wpaperd
  services.wpaperd = {
    enable = false;
    settings = {

    };
  };
}
