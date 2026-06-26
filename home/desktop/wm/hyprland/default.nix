{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  wme = pkgs.callPackage ./packages { };
  font = "JetBrainsMono Nerd Font Mono";
  numWorkspaces = 4;
in
{
  _module.args = {
    wme = wme;
  };
  # https://github.com/catppuccin
  # https://wiki.hypr.land/Useful-Utilities/Must-have/
  imports = [
    ./animations/animations.nix # 动画
    ./plugins/plugins.nix # 插件
    ./keybinding/keybinding.nix # 按键绑定
    ./output.nix # 显示器
    ./layer.nix # 层规则
    ./workspace.nix # 工作空间
    ./window.nix # 窗口
  ];

  home.packages = with pkgs; [
    hypr-kcs # hyprcs
    hyprpwcenter # pipewire控制中心
    hyprshutdown # 关机工具
    hyprsysteminfo # 系统信息工具
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1; # Chromium 内核应用 使用 Wayland
    MOZ_ENABLE_WAYLAND = 1; # Mozilla 系应用 使用 Wayland
    GDK_BACKEND = "wayland,x11,*"; # GTK 框架应用 使用 Wayland
    SDL_VIDEODRIVER = "wayland"; # 游戏及多媒体应用 使用 Wayland
    CLUTTER_BACKEND = "wayland"; # Clutter 框架应用 使用 Wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto"; # Electron 应用 使用 Wayland
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

    settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function ()
              hl.exec_cmd("${pkgs.anyrun}/bin/anyrun daemon")
            end
          '')
        ];
      };
      # General / Decoration / Input / Dwindle
      # https://wiki.hypr.land/Configuring/Variables/#general
      config = {
        general = {
          border_size = 2;
          gaps_in = 1;
          gaps_out = 2;
          float_gaps = 5;
          col = {
            inactive_border = "#595959aa";
            # 天蓝/靛紫色/翠绿
            active_border = {
              colors = [
                "#33ccffee"
                "#6c71ffee"
                "#00ff99ee"
              ];
              angle = 45;
            };
          };
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          active_opacity = 0.92;
          inactive_opacity = 0.95;
          fullscreen_opacity = 0.92;
          dim_modal = true;
          # dim_inactive = true;
        };
        input = {
          sensitivity = 0.5;
          accel_profile = "adaptive";
          follow_mouse = 0;
        };
        group = {
          auto_group = true;
          insert_after_current = true;
          focus_removed_window = true;
          drag_into_group = 1;
          merge_groups_on_drag = true;
          merge_groups_on_groupbar = true;
          merge_floated_into_tiled_on_groupbar = false;
          group_on_movetoworkspace = false;
          col = {
            border_inactive = "#313244aa";
            border_active = {
              colors = [
                "#b4befeee"
                "#cba6f7ee"
                "#6c71ffee"
              ];
              angle = 45;
            };
            border_locked_inactive = "#45475aaa";
            border_locked_active = {
              colors = [
                "#f9e2afee"
                "#fab387ee"
                "#f38ba8ee"
              ];
              angle = 45;
            };
          };
          groupbar = {
            enabled = true;
            font_family = font;
            font_size = 11;
            font_weight_active = "bold";
            font_weight_inactive = "normal";
            gradients = false;
            height = 14;
            indicator_gap = 2;
            indicator_height = 3;
            stacked = false;
            priority = 3;
            render_titles = true;
            text_padding = 2;
            scrolling = true;
            rounding = 2;
            rounding_power = 2.0;
            gradient_rounding = 2;
            gradient_rounding_power = 2.0;
            round_only_edges = true;
            gradient_round_only_edges = true;
            text_color = "#cdd6f4ee";
            col = {
              active = "#89b4faee";
              inactive = "#1e1e2eaa";
              locked_active = "#89b4faee";
              locked_inactive = "#1e1e2eaa";
            };
            gaps_in = 2;
            gaps_out = 2;
            keep_upper_gap = true;
            blur = true;
          };
        };
        binds = {
          drag_threshold = 10;
        };
        misc = {
          disable_hyprland_logo = false;
          disable_splash_rendering = false;
          disable_scale_notification = false;
          force_default_wallpaper = true;
          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
          font_family = font;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
        };
        debug = {
          disable_logs = true;
          disable_time = true;
        };
        dwindle = {
          force_split = 0;
          preserve_split = true;
          smart_split = false;
        };
      };
    };
    extraLuaFiles = {
      # https://github.com/shezdy/hyprsplit
      "hyprsplit/init" = {
        autoLoad = false;
        content = builtins.readFile "${pkgs.hyprsplit}/init.lua";
      };
      "hyprload" = {
        autoLoad = true;
        content = ''
          hl.plugin.hyprsplit = require("hyprsplit")
          -- 配置工作空间数量
          hl.plugin.hyprsplit.config( { num_workspaces = ${toString numWorkspaces} } )
        ''
        + (
          if customize.desktop.monitor-secondary != "" then
            ''hl.plugin.hyprsplit.monitor_priority({ "${customize.desktop.monitor-primary}", "${customize.desktop.monitor-secondary}" })''
          else
            ''hl.plugin.hyprsplit.monitor_priority({ "${customize.desktop.monitor-primary}" })''
        );
      };
    };
    extraConfig = ''
      -- refers to $XDG_CONFIG_HOME/hypr/hyprland-extra.lua
      require("hyprland-extra")
    '';
  };

  # BUG: https://github.com/nix-community/home-manager/issues/4922
  systemd.user.tmpfiles.rules = [
    "L+ %h/.config/systemd/user/xdg-desktop-portal.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal.service"
    "L+ %h/.config/systemd/user/xdg-document-portal.service - - - - %h/.nix-profile/share/systemd/user/xdg-document-portal.service"
    "L+ %h/.config/systemd/user/xdg-permission-store.service - - - - %h/.nix-profile/share/systemd/user/xdg-permission-store.service"
    "L+ %h/.config/systemd/user/xdg-desktop-portal-hyprland.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal-hyprland.service"
    "L+ %h/.config/systemd/user/xdg-desktop-portal-gtk.service - - - - %h/.nix-profile/share/systemd/user/xdg-desktop-portal-gtk.service"
  ];

  # 创建扩展配置文件，如果不存在
  home.activation.create-hyprland-config-extra = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    file=${config.xdg.configHome}/hypr/hyprland-extra.lua
    if [ ! -f "$file" ]; then
      mkdir -p "$(dirname "$file")"
      touch "$file"
    fi
  '';
}
