{ config, lib, pkgs, ... }: 
{
  home.packages = with pkgs;[
    dconf2nix     # 用于将dconf配置转换为nix表达式
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
      binding = "<Control>Print";
    };

    "org/gnome/shell/keybindings" = {
      # screenshot = ["<Shift>Print"];                      # 截图, 默认: <Shift>Print
      # screenshot-window = ["<Alt>Print"];                 # 窗口截图, 默认: <Alt>Print
      # show-screenshot-ui = ["Print"];                     # 交互式截图, 默认: Print
      # show-screen-recording-ui = ["<Ctrl><Shift><Alt>R"]; # 交互式屏幕录制, 默认： <Ctrl><Shift><Alt>R
    };
  };
}