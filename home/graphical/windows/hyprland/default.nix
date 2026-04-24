{
  config,
  lib,
  pkgs,
  extra-pkgs,
  ...
}:
{
  # https://github.com/catppuccin
  # https://wiki.hypr.land/Useful-Utilities/Must-have/
  imports = [
    ./hypr-config # Hyprland配置
    ./settings-center # 设置中心
    ./authentication-agent # 身份验证代理
    ./app-launchers # 应用启动器
    ./status-bars # 状态栏
    ./notification-center # 通知中心
    ./idle-management # 空闲管理
    ./screen-lock # 屏幕锁定
    ./wallpaper # 壁纸
    ./sunset # 蓝光保护
    ./clipboard # 剪贴板
    ./window-switcher # 窗口切换器
    ./logout # 登出配置
    ./scripts # 脚本配置
  ];

  home.packages =
    with pkgs;
    [
      hyprpicker # 颜色拾取器
      qalculate-gtk # 计算器
      # nautilus # 文件管理器
      nemo-with-extensions # 文件管理器
      wttrbar # 天气栏
      gpu-usage-waybar # GPU使用率栏

    ]
    ++ [
      extra-pkgs.hypr-kcs # hyprcs
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

  # XDG portal config for Hyprland
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      extra-pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = [
      "hyprland"
      "gtk"
    ];
    configPackages = [ extra-pkgs.hyprland ];
  };

  wayland.windowManager.hyprland = {
    package = extra-pkgs.hyprland;
    portalPackage = extra-pkgs.xdg-desktop-portal-hyprland;
    enable = true;
    xwayland.enable = true;
    systemd = {
      enableXdgAutostart = true;
      variables = [ "--all" ];
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
