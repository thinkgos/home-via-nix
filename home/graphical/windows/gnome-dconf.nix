{ config, lib, pkgs, ... }: 
{
  home.packages = with pkgs;[
    dconf2nix     # 用于将dconf配置转换为nix表达式
    whitesur-gtk-theme  # MacOS like theme for all gtk based desktops
    whitesur-icon-theme # MacOS Big Sur style icon theme for linux desktops
  ];
  # dconf2nix: https://github.com/nix-community/dconf2nix
  # gvariant:https://github.com/nix-community/home-manager/blob/master/modules/lib/gvariant.nix
  dconf.settings = with lib.hm.gvariant; {
    # 查看相关配置： gsettings list-recursively org.gnome.xxx.xx 

    # 主题
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Adwaita";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur-dark";
    };
    # 键盘快捷键
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Alt>1"];
      switch-to-workspace-2 = ["<Alt>2"];
      switch-to-workspace-3 = ["<Alt>3"];
      switch-to-workspace-4 = ["<Alt>4"];
    };
    # 工作区数量
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
    };
    # 键盘快捷键 - 截图
    "org/gnome/shell/keybindings" = {
      screenshot = mkEmptyArray type.string;                # 截图, 默认: <Shift>Print
      screenshot-window = mkEmptyArray type.string;         # 窗口截图, 默认: <Alt>Print
      show-screenshot-ui = mkEmptyArray type.string;        # 交互式截图, 默认: Print
      # show-screen-recording-ui = ["<Ctrl><Shift><Alt>R"]; # 交互式屏幕录制, 默认： <Ctrl><Shift><Alt>R
    };
     # 键盘快捷键
    "org/gnome/settings-daemon/plugins/media-keys" = {
      # 自定义截图快捷键
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
    };
     # 自定义截图快捷键
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "flameshot";
      command = "flameshot gui";
      binding = "Print";
    };
  };
}