{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    # ./wayvnc.nix
  ]
  ++ lib.optional (customize.graphics.window == "gnome") ./gnome
  ++ lib.optional (customize.graphics.window == "hyprland") ./hyprland;

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1; # Chromium 内核应用 使用 Wayland
    MOZ_ENABLE_WAYLAND = 1; # Mozilla 系应用 使用 Wayland
    GDK_BACKEND = "wayland,x11,*"; # GTK 框架应用 使用 Wayland
    SDL_VIDEODRIVER = "wayland"; # 游戏及多媒体应用 使用 Wayland
    CLUTTER_BACKEND = "wayland"; # Clutter 框架应用 使用 Wayland
    # XDG
    XDG_SESSION_TYPE = "wayland"; # 系统级中间件和桌面环境 使用 Wayland
    # XDG_SESSION_DESKTOP = ""; # window里定义
    # XDG_CURRENT_DESKTOP = "";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    # 由qt模块定义
    # QT_QPA_PLATFORMTHEME = "qt5ct";

    BAT_PAGER = "less -r";
    TMPDIR = "$HOME/.cache/tmp";
  };

}
