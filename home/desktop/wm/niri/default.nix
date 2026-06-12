{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # https://github.com/sodiboo/niri-flake
  imports = [
    ./keybinding/keybinding.nix # 按键绑定
    ./animations/animations.nix # 动画
    ./input.nix # 输入
    ./output.nix # 输出
    ./layout.nix # 布局规则
    ./layer.nix # 层规则
    ./workspace.nix # 工作空间
    ./window.nix # 窗口
    ./overview.nix # 概览
    ./piri.nix # Piri
    ./extensions/extensions.nix # 扩展
  ];

  home.sessionVariables = {
    DISPLAY = null;
    NIXOS_OZONE_WL = 1; # Chromium 内核应用 使用 Wayland
    MOZ_ENABLE_WAYLAND = 1; # Mozilla 系应用 使用 Wayland
    GDK_BACKEND = "wayland,x11,*"; # GTK 框架应用 使用 Wayland
    SDL_VIDEODRIVER = "wayland"; # 游戏及多媒体应用 使用 Wayland
    CLUTTER_BACKEND = "wayland"; # Clutter 框架应用 使用 Wayland
    # xdg
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
    XDG_CURRENT_DESKTOP = "niri";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
  };

  # XDG portal config
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common = {
      default = [
        "gnome"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Access" = [ "gtk" ];
      "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
    configPackages = [ pkgs.niri ];
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      spawn-at-startup = [
        {
          argv = [
            "${pkgs.anyrun}/bin/anyrun"
            "daemon"
          ];
        }
        {
          argv = [
            "sh"
            "-c"
            "${pkgs.piri}/bin/piri daemon > /dev/null 2>&1 &"
          ];
        }
      ];
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/screenshots/%Y%m%d%H%M%S.png";
      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite-unstable;
      };
      cursor = {
        theme = customize.cursor.name;
        size = 24;
        hide-when-typing = true;
        hide-after-inactive-ms = 5000;
      };
      clipboard = {
        disable-primary = true;
      };
      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = false;
      };
      config-notification = {
        disable-failed = false;
      };
      # TODO: 开启模糊效果
      # blur = {
      #   passes = 3;
      #   offset = 3;
      #   noise = 0.02;
      #   saturation = 1.5;
      # };
    };
  };

  systemd.user.tmpfiles.rules = [
    "L+ %h/.config/systemd/user/xdg-desktop-portal.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal.service"
    "L+ %h/.config/systemd/user/xdg-document-portal.service - - - - %h/.nix-profile/share/systemd/user/xdg-document-portal.service"
    "L+ %h/.config/systemd/user/xdg-permission-store.service - - - - %h/.nix-profile/share/systemd/user/xdg-permission-store.service"
    "L+ %h/.config/systemd/user/xdg-desktop-portal-gnome.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal-gnome.service"
    "L+ %h/.config/systemd/user/xdg-desktop-portal-gtk.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal-gtk.service"
    "L+ %h/.config/systemd/user/niri.service - - - - %h/.nix-profile/share/systemd/user/niri.service"
    "L+ %h/.config/systemd/user/niri-shutdown.service - - - - %h/.nix-profile/share/systemd/user/niri-shutdown.service"
  ];
}
