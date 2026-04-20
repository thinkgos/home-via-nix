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
  home.sessionVariables = {
    XDG_SESSION_DESKTOP = "GNOME";
    XDG_CURRENT_DESKTOP = "GNOME";
  };
  home.packages = with pkgs; [
    albert # 启动器(可选替代ulauncher)
  ];
}
