{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 身份验证代理
  # https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent/
  services.hyprpolkitagent = {
    enable = true;
  };
}
