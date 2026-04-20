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
    ./scripts # 脚本配置
  ];

  home.packages = with pkgs; [
    hyprpicker # 颜色拾取器
    qalculate-gtk # 计算器
    # nautilus # 文件管理器
    nemo-with-extensions # 文件管理器
  ];

  # XDG portal config for Hyprland
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.common.default = [
      "hyprland"
      "gtk"
    ];
    configPackages = [ pkgs.hyprland ];
  };

  # BUG: https://github.com/nix-community/home-manager/issues/4922
  home.file.".config/systemd/user/xdg-desktop-portal-hyprland.service".source =
    "${pkgs.xdg-desktop-portal-hyprland}/share/systemd/user/xdg-desktop-portal-hyprland.service";
  home.file.".config/systemd/user/xdg-desktop-portal-gtk.service".source =
    "${pkgs.xdg-desktop-portal-gtk}/share/systemd/user/xdg-desktop-portal-gtk.service";
}
