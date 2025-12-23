{ config, lib, pkgs, customize, ... }: 
let 
  gnome-48-extensions = with pkgs;[
    # NOTE: 注释掉的从系统安装, nix不兼容gnome-48
    # - user-themes 用户主题
    # - auto-move-windows 自动移动窗口
    # gnome-shell-extensions                          # 包含多种扩展
    gnomeExtensions.tophat                          # 系统资源监控
    gnomeExtensions.gnome-40-ui-improvements        # GNOME 40界面改进
    gnomeExtensions.kimpanel                        # 输入法面板
    gnomeExtensions.appindicator                    # 应用程序指示器
    gnomeExtensions.clipboard-indicator             # clipboard管理
    gnomeExtensions.tiling-shell                    # 平铺窗口
    gnomeExtensions.dash-to-dock                    # 任务栏
    gnomeExtensions.hide-top-bar                    # 隐藏顶部栏
    gnomeExtensions.compiz-alike-magic-lamp-effect  # 仿Compiz的魔法灯效果
    # gnomeExtensions.compiz-windows-effect           # 仿Compiz的窗口特效
    gnomeExtensions.open-bar                        # top bar
    gnomeExtensions.blur-my-shell                   # 模糊窗口
    gnomeExtensions.customize-clock-on-lock-screen  # 自定义锁屏时间显示
  ];
in
{
  home.packages = with pkgs;[
    # 从系统安装
    # https://extensions.gnome.org
    # gnome-browser-connector # 浏览器连接器
    
    gnome-tweaks                                    # 系统设置(可选替代refine)
    # 扩展管理
    # gnome-shell                                     # 扩展管理        
  ] ++lib.optionals (customize.window-version == "gnome-48") gnome-48-extensions;

  
  # NOTE: 扩展配置位于 gnome-dconf.nix
  programs = {
    gnome-shell = lib.mkIf (customize.window-version == "gnome-49") {
      enable = true;
      # 主题单独配置
      # 使用的是 gnome-shell-extensions 包含多种扩展
      # - user-themes 用户主题
      # - auto-move-windows 自动移动窗口
      theme = {
        name = "WhiteSur-Dark";
        package = pkgs.whitesur-gtk-theme;
      };
      extensions = with pkgs;[
        # 自动移动窗口
        { package = gnome-shell-extensions; id = "auto-move-windows@gnome-shell-extensions.gcampax.github.com"; }
        # 系统资源监控
        { package = gnomeExtensions.tophat; }
        # GNOME 40界面改进
        { package = gnomeExtensions.gnome-40-ui-improvements; }
        # 输入法面板
        { package = gnomeExtensions.kimpanel; }
        # 应用程序指示器
        { package = gnomeExtensions.appindicator; }
        # clipboard管理
        { package = gnomeExtensions.clipboard-indicator; }
        # 平铺窗口
        { package = gnomeExtensions.tiling-shell; }
        # 任务栏
        { package = gnomeExtensions.dash-to-dock; }
        # 隐藏顶部栏
        { package = gnomeExtensions.hide-top-bar; }
        # 仿Compiz的魔法灯效果
        { package = gnomeExtensions.compiz-alike-magic-lamp-effect; }
        # 仿Compiz的窗口特效
        { package = gnomeExtensions.compiz-windows-effect; }
        # top bar
        # { package = gnomeExtensions.open-bar; }
        # 模糊窗口
        { package = gnomeExtensions.blur-my-shell; }
      ];
    };
  };

  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/shell" = {
      enabled-extensions = lib.mkIf 
        (customize.window-version == "gnome-48") 
        (
          (map (extension: extension.extensionUuid) gnome-48-extensions)
          ++[
            "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "compiz-windows-effect@hermes83.github.com"
          ]
        );
      disabled-extensions = [
        pkgs.gnomeExtensions.open-bar.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "WhiteSur-Dark";
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list=[
        "google-chrome.desktop:1" 
        "code.desktop:2"
        "realvnc-vncviewer.desktop:3"
        "dev.warp.Warp.desktop:4"
        "kitty.desktop:4"
        # "org.wezfurlong.wezterm.desktop:4"
      ];
    };

    "org/gnome/shell/extensions/tophat" = {
      position-in-panel = "left";
      show-icons = true;
      show-menu-actions = false;
      refresh-rate = "slow";
      use-system-accent = true;
      meter-fg-color = "rgb(51,209,122)";
      cpu-display = "numeric";
      group-procs = true;
      mem-abs-units = false;
      mem-display = "numeric";
      show-disk = true;
      fs-display = "numeric";
      mount-to-monitor = "/";
    };

    "org/gnome/shell/extensions/appindicator" = {
      legacy-tray-enabled = true;
      icon-brightness = 0.0;
      icon-contrast = 0.0;
      icon-opacity = 200;
      icon-saturation = 0.0;
      icon-size = 0;
      tray-pos = "right";
    };
    
    "org/gnome/shell/extensions/clipboard-indicator" = {
      cache-size = 10;
      history-size = 100;
      topbar-preview-size = 15;
      disable-down-arrow = false;
      enable-keybindings = false;
      move-item-first = true;
      paste-button = true;
      regex-search = true;
    };

    # 平铺窗口扩展配置
    "org/gnome/shell/extensions/tilingshell" = {
      enable-autotiling = false;
      enable-window-border = false;
      enable-wraparound-focus = true;
      enable-snap-assist = false;
      inner-gaps = mkUint32 2;
      layouts-json=''[{"id":"Layout 1","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[2]},{"x":0.5,"y":0,"width":0.49999999999999994,"height":0.5,"groups":[4,2]},{"x":0.5,"y":0.5,"width":0.49999999999999994,"height":0.49999999999999994,"groups":[4,2]}]},{"id":"Layout 2","tiles":[{"x":0,"y":0,"width":0.49947916666666664,"height":1,"groups":[2]},{"x":0.49947916666666664,"y":0,"width":0.5005208333333333,"height":1,"groups":[2]}]},{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.5,"height":0.5,"groups":[1,2]},{"x":0.5,"y":0,"width":0.5000000000000014,"height":0.5,"groups":[3,1]},{"x":0,"y":0.5,"width":0.5,"height":0.49999999999999994,"groups":[2,1]},{"x":0.5,"y":0.5,"width":0.5000000000000014,"height":0.5,"groups":[3,1]}]}]'';
      outer-gaps = mkUint32 2;
      overridden-settings=''{"org.gnome.mutter.keybindings":{"toggle-tiled-right":"['<Super>Right']","toggle-tiled-left":"['<Super>Left']"},"org.gnome.desktop.wm.keybindings":{"maximize":"['<Super>Up']","unmaximize":"['<Super>Down', '<Alt>F5']"},"org.gnome.mutter":{"edge-tiling":"true"}}'';
      quarter-tiling-threshold = mkUint32 30;
      selected-layouts = [["Layout 2" "Layout 1"] ["Layout 2" "Layout 1"] ["Layout 2" "Layout 1"] ["Layout 2" "Layout 1"]];
      window-use-custom-border-color = false;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      always-center-icons = true;
      apply-custom-theme = true;
      background-color = "rgb(222,221,218)";
      background-opacity = 0.75;
      click-action = "focus-minimize-or-previews";
      custom-background-color = false;
      custom-theme-shrink = false;
      dash-max-icon-size = 40;
      disable-overview-on-startup = false;
      dock-position = "BOTTOM";
      extend-height = false;
      height-fraction = 0.90;
      icon-size-fixed = false;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      preferred-monitor = -2;
      # preferred-monitor-by-connector = "eDP-1";
      preview-size-scale = 0.70;
      running-indicator-style = "DASHES";
      transparency-mode = "FIXED";
    };

    "org/gnome/shell/extensions/ncom/github/hermes83/compiz-alike-magic-lamp-effect" = {
      duration = 500.0;
      effect = "default";
      x-tiles = 15.0;
      y-tiles = 20.0;
    };

    "org/gnome/shell/extensions/com/github/hermes83/compiz-windows-effect" = {
      friction = 3.70;
      mass = 60.0;
      resize-effect = true;
      speedup-factor-divider = 12.0;
      x-tiles = 8.0;
      y-tiles = 8.0;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      hacks-level = 2;
      settings-version = 2;
    };
    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      blur = false;
      brightness = 0.6;
      sigma = 30;
      style-dialogs = 1;
    };
    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      brightness = 0.85;
      dynamic-opacity = false;
      opacity = 245;
      sigma = 0;
      whitelist = ["org.gnome.Nautilus" "dev.zed.Zed" "code"];
    };
    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      blur = false;
      pipeline = "pipeline_default";
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
      brightness = 0.6;
      pipeline = "pipeline_default";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
      unblur-in-overview = false;
    };
    "org/gnome/shell/extensions/hidetopbar" = {
      enable-active-window = false;
      enable-intellihide = false;
      mouse-sensitive = true;
      mouse-sensitive-fullscreen-window = false;
      pressure-threshold = 100;
      pressure-timeout = 800;
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-panel" = {
      blur-original-panel = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };
    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = true;
      pipeline = "pipeline_default_rounded";
      style-components = 3;
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default";
      sigma = 30;
      static-blur = true;
      unblur-in-overview = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };
    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      blur = false;
      brightness = 0.6;
      sigma = 30;
    };
  };
}