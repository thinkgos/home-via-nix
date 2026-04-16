{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://github.com/catppuccin
  # https://wiki.hypr.land/Useful-Utilities/Must-have/
  # 必装系统软件:
  # sudo apt install -y \
  #       pipewire pipewire-pulse pipewire-alsa wireplumber \
  #       brightnessctl bluez playerctl \
  #       qt6-wayland \
  #       fonts-noto-core fonts-noto-cjk \
  #       gvfs \
  #       network-manager \
  #       libnotify-bin \
  #       thermald \
  #       power-profiles-daemon \
  #       gnome-keyring
  # sddm桌面登录
  # sudo apt install sddm
  # sudo apt purge xdg-desktop-portal-kde xwaylandvideobridge
  # sudo bash -c 'cat > /usr/share/wayland-sessions/hyprland.desktop << EOF
  # [Desktop Entry]
  # Name=Hyprland
  # Comment=Hyprland managed by Home Manager
  # Exec=/home/cors/.nix-profile/bin/start-hyprland
  # Type=Application
  # DesktopNames=Hyprland
  # EOF'
  imports = [
    ./hyprland.nix # Hyprland配置
    ./authentication-agent # 身份验证代理
    ./app-launchers # 应用启动器
    ./status-bars # 状态栏
    ./notification-center # 通知中心
    ./idle-management # 空闲管理
    ./screen-lock # 屏幕锁定
    ./wallpaper # 壁纸
    ./sunset # 蓝光保护
    ./clipboard # 剪贴板
  ];

  home.packages = with pkgs; [
    wl-clipboard # wayland剪贴板工具
    hyprpicker # 颜色拾取器
    hyprsysteminfo # 系统信息工具
    qalculate-gtk # 计算器
    hyprpwcenter # pipewire 控制中心
    hyprshutdown # 关机工具
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
}
