{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 身份验证代理
  imports = [
    ./polkit-gnome.nix
  ];
}
