{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 蓝光保护
  # https://wiki.hypr.land/Hypr-Ecosystem/hyprsunset/
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 150;
      profile = [
        {
          time = "7:00";
          identity = true;
        }
        {
          time = "18:30";
          temperature = 4500;
          gamma = 1.0;
        }
        {
          time = "21:00";
          temperature = 3500;
          gamma = 0.9;
        }
      ];
    };
  };
}
