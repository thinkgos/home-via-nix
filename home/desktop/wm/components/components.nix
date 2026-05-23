{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./settings-center/settings-center.nix # 设置中心
    ./notification-center/notification-center.nix # 通知中心
    ./sunset/sunset.nix # 蓝光保护
    ./polkit-agent/polkit-agent.nix # 身份验证代理
    ./idle-manager/idle-manager.nix # 空闲管理
    ./logout/logout.nix # 登出配置
    ./clipboard/clipboard.nix # 剪贴板
    ./file-manager/file-manager.nix # 文件管理器
    ./wallpaper/wallpaper.nix # 壁纸
    ./launcher/launcher.nix # 应用启动器
    ./assist/assist.nix # 辅助
  ];
}
