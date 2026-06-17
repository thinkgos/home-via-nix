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
    enable = true;
    settings = {
      default = {
        duration = "30m";
        sorting = "ascending";
        mode = "stretch";
      };
      any = {
        path = "${config.xdg.dataHome}/wallpapers/scenery/2.png";
      };
    };
  };
}
