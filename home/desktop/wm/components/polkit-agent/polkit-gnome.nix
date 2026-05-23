{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 身份验证代理
  services.polkit-gnome = {
    enable = true;
  };
}
