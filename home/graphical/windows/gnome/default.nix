{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./gnome-dconf.nix
    ./gnome-shell-extensions.nix
  ];

  home.packages = with pkgs; [
    albert # 启动器(可选替代ulauncher)
  ];
}
