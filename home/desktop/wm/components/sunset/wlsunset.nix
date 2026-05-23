{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 蓝光保护
  # https://github.com/kennylevinsen/wlsunset
  services.wlsunset = {
    enable = true;
    gamma = 1.0;
    output = null;
    # latitude = 26.07;
    # longitude = 119.30;
    sunrise = "07:00"; # 日出时间
    sunset = "20:30"; # 日落时间
    temperature = {
      day = 6500;
      night = 4000;
    };
  };
}
