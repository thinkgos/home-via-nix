{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports =
    [ ]
    ++ lib.optionals (customize.desktop.window == "hyprland" || customize.desktop.window == "niri") [
      ./settings-center/settings-center.nix # 设置中心
      ./notification-center/notification-center.nix # 通知中心
      ./sunset/sunset.nix # 蓝光保护
      ./clipboard/clipboard.nix # 剪贴板
      ./file-manager/file-manager.nix # 文件管理器
      ./wallpaper/wallpaper.nix # 壁纸
      ./launcher/launcher.nix # 应用启动器
      ./assist/assist.nix # 辅助
    ];
}
