{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    dconf2nix # 用于将dconf配置转换为nix表达式
  ];
  # dconf2nix: https://github.com/nix-community/dconf2nix
  # gvariant: https://github.com/nix-community/home-manager/blob/master/modules/lib/gvariant.nix
  dconf.settings = with lib.hm.gvariant; {
    # 查看相关配置： gsettings list-recursively org.gnome.xxx.xx
    # 导出路径具体的配置： dconf dump /org/xx/xx > xx.settings

    "org/gnome/desktop/privacy" = {
      remember-recent-files = true; # 文件历史记录
      recent-files-max-age = 30; # 文件历史持续时间
      remove-old-temp-files = true; # 自动清空临时文件
      remove-old-trash-files = true; # 自动清空回收站
      old-files-age = mkUint32 7; # 自动清空周期
    };
    "org/gnome/desktop/peripherals/mouse" = {
      speed = 0.325;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false; # 动态工作区 - 禁用
      workspaces-only-on-primary = true; # 工作区只作用于主屏目
    };
    "org/gnome/mutter/keybindings" = {
      # 开启tiling-shell已覆盖
      toggle-tiled-left = mkEmptyArray type.string; # 分屏到左侧平铺窗口, 默认: <Super>Left
      toggle-tiled-right = mkEmptyArray type.string; # 分屏到右侧平铺窗口, 默认: <Super>Right
    };
    # 主题
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "WhiteSur-cursors";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur-dark";
      font-name = "Inter 11";
      document-font-name = "Inter 11";
      monospace-font-name = "JetBrainsMono Nerd Font Mono 11";
    };
    "org/gnome/desktop/wm/keybindings" = {
      # 开启tiling-shell已覆盖
      unmaximize = mkEmptyArray type.string;
      maximize = mkEmptyArray type.string;
      switch-applications = mkEmptyArray type.string;
      switch-applications-backward = mkEmptyArray type.string;

      switch-windows = [ "<Super>Tab" ];
      switch-windows-backward = [ "<Shift><Super>Tab" ];
      toggle-fullscreen = [ "<Super>f" ];
      toggle-maximized = [ "<Super>m" ];
      close = [ "<Super>q" ];

      switch-to-workspace-1 = [
        "<Super>1"
        "<Super>Home"
      ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-last = [ "<Super>End" ];
      switch-to-workspace-left = [ "<Super>Page_Up" ];
      switch-to-workspace-right = [ "<Super>Page_Down" ];

      move-to-workspace-1 = [
        "<Shift><Super>1"
        "<Shift><Super>Home"
      ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      move-to-workspace-last = [ "<Shift><Super>End" ];
      move-to-workspace-left = [ "<Shift><Super>Page_Up" ];
      move-to-workspace-right = [ "<Shift><Super>Page_Down" ];
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4; # 工作区数量
      button-layout = "close,minimize,maximize:appmenu"; # 窗口按钮布局
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      terminal = [ "<Super>t" ]; # 启动终端
      www = [ "<Super>b" ]; # 启动浏览器
      calculator = [ "<Super>c" ]; # 启动计算器
      home = [ "<Super>e" ]; # 启动文件管理器

      screensaver = [ "<Super>l" ]; # 锁屏
      # 自定义截图快捷键
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };
    # 自定义截图快捷键
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "flameshot";
      # command =  "sh -c 'flameshot gui --raw | wl-copy'";
      command = "sh -c 'flameshot gui < /dev/null'";
      binding = "<Control>Print";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "albert";
      command = "albert toggle";
      binding = "<Super>semicolon";
    };

    "org/gnome/shell/keybindings" = {
      # screenshot = ["<Shift>Print"];                      # 截图, 默认: <Shift>Print
      # screenshot-window = ["<Alt>Print"];                 # 窗口截图, 默认: <Alt>Print
      # show-screenshot-ui = ["Print"];                     # 交互式截图, 默认: Print
      # show-screen-recording-ui = ["<Ctrl><Shift><Alt>R"]; # 交互式屏幕录制, 默认： <Ctrl><Shift><Alt>R
    };
  };
}
