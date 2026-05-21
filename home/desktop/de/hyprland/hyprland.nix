{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://github.com/catppuccin
  # https://wiki.hypr.land/Useful-Utilities/Must-have/
  imports = [
    ./hypr-config/hypr-config.nix # Hyprland配置
    ./status-bars/status-bars.nix # 状态栏
    ./idle-management/idle-management.nix # 空闲管理
    ./screen-lock/screen-lock.nix # 屏幕锁定
    ./window-switcher/window-switcher.nix # 窗口切换器
    ./logout/logout.nix # 登出配置
    ./scripts/scripts.nix # 脚本配置
  ];

  home.packages = with pkgs; [
    hyprpicker # 颜色拾取器
    hypr-kcs # hyprcs
    hyprpwcenter # pipewire控制中心
    hyprshutdown # 关机工具
    hyprsysteminfo # 系统信息工具
    gpu-usage-waybar # GPU使用率栏
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1; # Chromium 内核应用 使用 Wayland
    MOZ_ENABLE_WAYLAND = 1; # Mozilla 系应用 使用 Wayland
    GDK_BACKEND = "wayland,x11,*"; # GTK 框架应用 使用 Wayland
    SDL_VIDEODRIVER = "wayland"; # 游戏及多媒体应用 使用 Wayland
    CLUTTER_BACKEND = "wayland"; # Clutter 框架应用 使用 Wayland
    # xdg
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    # 由qt模块定义
    # QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  # XDG portal config
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = [
      "hyprland"
      "gtk"
    ];
    configPackages = [ pkgs.hyprland ];
  };

  wayland.windowManager.hyprland = {
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
      # extraCommands = [
      #   # "systemctl --user start hyprland-session.target"
      # ];
    };
  };

  # BUG: https://github.com/nix-community/home-manager/issues/4922
  systemd.user.tmpfiles.rules = [
    "L+ %h/.config/systemd/user/xdg-desktop-portal.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal.service"
    "L+ %h/.config/systemd/user/xdg-document-portal.service - - - - %h/.nix-profile/share/systemd/user/xdg-document-portal.service"
    "L+ %h/.config/systemd/user/xdg-permission-store.service - - - - %h/.nix-profile/share/systemd/user/xdg-permission-store.service"
    "L+ %h/.config/systemd/user/xdg-desktop-portal-hyprland.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal-hyprland.service"
    "L+ %h/.config/systemd/user/xdg-desktop-portal-gtk.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal-gtk.service"
  ];
}
