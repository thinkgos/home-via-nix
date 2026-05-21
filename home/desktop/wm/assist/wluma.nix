{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 自动调节亮度
  # https://github.com/max-baz/wluma
  services.wluma = {
    enable = true;
    systemd.enable = true;
    settings = {
      als = {
        iio = {
          path = "";
          thresholds = {
            "0" = "night";
            "20" = "dark";
            "250" = "normal";
            "500" = "bright";
            "80" = "dim";
            "800" = "outdoors";
          };
        };
      };
    };
  };
}
