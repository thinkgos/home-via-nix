{ config, lib, pkgs, ... }: 
{
  home.packages = with pkgs;[
    dconf2nix     # 用于将dconf配置转换为nix表达式
    whitesur-gtk-theme  # MacOS like theme for all gtk based desktops
    whitesur-icon-theme # MacOS Big Sur style icon theme for linux desktops
    whitesur-cursors    # X-cursor theme inspired by macOS and based on capitaine-cursors

    gnome-tweaks                                    # 系统设置
    # 扩展管理
    gnome-shell                                     # 扩展管理        
    # gnome-shell-extensions                          # 包含多种扩展
    gnomeExtensions.user-themes                     # 用户主题
    gnomeExtensions.auto-move-windows               # 自动移动窗口
    gnomeExtensions.tiling-shell                    # 平铺窗口
    gnomeExtensions.kimpanel                        # 输入法面板
    gnomeExtensions.appindicator                    # 应用程序指示器
    gnomeExtensions.dash-to-dock                    # 任务栏
    gnomeExtensions.compiz-alike-magic-lamp-effect  # 仿Compiz的魔法灯效果
    gnomeExtensions.blur-my-shell                   # 模糊窗口
  ];
  # dconf2nix: https://github.com/nix-community/dconf2nix
  # gvariant: https://github.com/nix-community/home-manager/blob/master/modules/lib/gvariant.nix
  dconf.settings = with lib.hm.gvariant; {
    # 查看相关配置： gsettings list-recursively org.gnome.xxx.xx 
    # 导出路径具体的配置： dconf dump /org/xx/xx > xx.settings  

    "org/gnome/desktop/privacy" = {
      remember-recent-files = true;   # 文件历史记录
      recent-files-max-age = 30;      # 文件历史持续时间
      remove-old-temp-files = true;   # 自动清空临时文件
      remove-old-trash-files = true;  # 自动清空回收站
      old-files-age = mkUint32 7;     # 自动清空周期
    };
    "org/gnome/desktop/peripherals/mouse" = {
      speed = 0.325;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;         # 动态工作区 - 禁用
      workspaces-only-on-primary = true;  # 工作区只作用于主屏目
    };
    "org/gnome/mutter.keybindings" = {
      # 开启tiling-shell已覆盖
      # toggle-tiled-left = mkEmptyArray type.string;  # 分屏到左侧平铺窗口, 默认: <Super>Left
      # toggle-tiled-right = mkEmptyArray type.string;  # 分屏到右侧平铺窗口, 默认: <Super>Right
    };
    # 主题
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "WhiteSur-cursors";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur-dark"; 
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Alt>1"];
      switch-to-workspace-2 = ["<Alt>2"];
      switch-to-workspace-3 = ["<Alt>3"];
      switch-to-workspace-4 = ["<Alt>4"];
      toggle-fullscreen = ["<Super>F"];
      close = ["<Super>q"];
      # 开启tiling-shell已覆盖
      # unmaximize = mkEmptyArray type.string;  # 取消最大化, 默认: <Super>Up
      # maximize = mkEmptyArray type.string;    # 最大化, 默认: <Super>Up
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;                                  # 工作区数量
      button-layout = "close,minimize,maximize:appmenu";   # 窗口按钮布局
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      # 自定义截图快捷键
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
    };
     # 自定义截图快捷键
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "flameshot";
      # command =  "sh -c 'flameshot gui --raw | wl-copy'";
      command = "sh -c 'flameshot gui < /dev/null'";
      binding = "Print";
    };

    "org/gnome/shell/keybindings" = {
      screenshot = mkEmptyArray type.string;                # 截图, 默认: <Shift>Print
      screenshot-window = mkEmptyArray type.string;         # 窗口截图, 默认: <Alt>Print
      show-screenshot-ui = mkEmptyArray type.string;        # 交互式截图, 默认: Print
      # show-screen-recording-ui = ["<Ctrl><Shift><Alt>R"]; # 交互式屏幕录制, 默认： <Ctrl><Shift><Alt>R
    };

    #! gnome 扩展配置
    "org/gnome/shell/extensions/user-theme" = {
      name = "WhiteSur-Dark";
    };

    # 平铺窗口扩展配置
    "org/gnome/shell/extensions/tilingshell" = {
      enable-window-border = false;
      enable-wraparound-focus = true;
      enable-snap-assist = false;
      inner-gaps = mkUint32 2;
      layouts-json=''[{"id":"Layout 1","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[2]},{"x":0.5,"y":0,"width":0.49999999999999994,"height":0.5,"groups":[4,2]},{"x":0.5,"y":0.5,"width":0.49999999999999994,"height":0.49999999999999994,"groups":[4,2]}]},{"id":"Layout 2","tiles":[{"x":0,"y":0,"width":0.49947916666666664,"height":1,"groups":[2]},{"x":0.49947916666666664,"y":0,"width":0.5005208333333333,"height":1,"groups":[2]}]},{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.5,"height":0.5,"groups":[1,2]},{"x":0.5,"y":0,"width":0.5000000000000014,"height":0.5,"groups":[3,1]},{"x":0,"y":0.5,"width":0.5,"height":0.49999999999999994,"groups":[2,1]},{"x":0.5,"y":0.5,"width":0.5000000000000014,"height":0.5,"groups":[3,1]}]}]'';
      outer-gaps = mkUint32 2;
      overridden-settings=''{"org.gnome.mutter.keybindings":{"toggle-tiled-right":"['<Super>Right']","toggle-tiled-left":"['<Super>Left']"},"org.gnome.desktop.wm.keybindings":{"maximize":"['<Super>Up']","unmaximize":"['<Super>Down', '<Alt>F5']"},"org.gnome.mutter":{"edge-tiling":"true"}}'';
      quarter-tiling-threshold = mkUint32 30;
      selected-layouts = [["Layout 1" "Layout 2"] ["Layout 1" "Layout 2"] ["Layout 1" "Layout 1"] ["Layout 1" "Layout 2"]];
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
      preferred-monitor-by-connector = "eDP-1";
      preview-size-scale = 0.70;
      running-indicator-style = "DASHES";
      transparency-mode = "FIXED";
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list=[
        "google-chrome.desktop:1" 
        "code.desktop:2"
        "realvnc-vncviewer.desktop:3"
        "dev.warp.Warp.desktop:4"
        "org.wezfurlong.wezterm.desktop:4"
      ];
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
      whitelist = ["org.gnome.Nautilus"];
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