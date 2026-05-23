{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 身份验证代理
  imports = [
    # ./hyprpolkitagent.nix
    ./polkit-gnome.nix
  ];
}
