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
    ./daemon.nix # 守护进程
    ./app-launchers.nix # 应用启动器
    ./status-bars.nix # 状态栏
    ./notification-center.nix # 通知中心
    ./idle-management.nix # 空闲管理
    ./screen-lock.nix # 屏幕锁定
    ./wallpaper.nix # 壁纸
    ./sunset.nix # 蓝光配置
  ];

  home.packages = with pkgs; [
    nautilus # 文件管理器
    wl-clipboard # wayland剪贴板工具
    hyprpicker # 颜色拾取器
    hyprsysteminfo # 系统信息工具
    qalculate-gtk # 计算器
    # nemo # 文件管理器
    # nemo-fileroller
    # nemo-preview
  ];

  home.sessionVariables = {
    XCURSOR_SIZE = "24"; # 定义鼠标光标的大小
  };

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
