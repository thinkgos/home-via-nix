{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 壁纸
  # https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = true;
      splash_offset = 20;
      splash_opacity = 0.8;
      ipc = true;
      wallpaper = [
        {
          monitor = "";
          path = "${config.xdg.dataHome}/wallpapers/dynamic";
          fit_mode = "cover"; # contain|cover|tile|fill
          timeout = 600; # 10min
          # order = "random"; # 暂不支持
          # recursive = true; # 暂不支持
        }
      ];
    };
  };
}
