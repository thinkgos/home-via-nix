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
    NIXOS_OZONE_WL = 1; # Chromium 内核应用 使用 Wayland
    MOZ_ENABLE_WAYLAND = 1; # Mozilla 系应用 使用 Wayland
    QT_QPA_PLATFORM = "wayland;xcb";
  };
  home.packages = with pkgs; [
    albert # 启动器(可选替代ulauncher)
  ];
}
