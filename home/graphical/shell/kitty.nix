{ config, lib, pkgs, ... }: 
{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-rc";
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 10.0;
    };
    extraConfig = builtins.readFile ./assets/Catppuccin-Mocha.conf;
    keybindings = {
      # 标签页管理
      "ctrl+shift+t" = "new_tab";                                 # 创建标签页
      "ctrl+shift+q" = "close_tab";                               # 关闭标签页

      # 窗口管理
      "ctrl+shift+e" = "launch --location=hsplit --cwd=current";  # 水平分割窗口
      "ctrl+shift+d" = "launch --location=vsplit --cwd=current";  # 垂直分割窗口
      "ctrl+shift+w" = "close_window";                            # 关闭窗口
      "ctrl+shift+[" = "previous_window";                         # 上一个窗口
      "ctrl+shift+right" = "previous_window";                     # 上一个窗口 
      "ctrl+shift+]" = "next_window";                             # 下一个窗口
      "ctrl+shift+left" = "next_window";                          # 下一个窗口
      "ctrl+shift+r" = "start_resizing_window";                   # 调整窗口大小
    };
    settings = {
      # tab bar
      tab_bar_edge  = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";

      # window
      hide_window_decorations = "titlebar-only";
      window_padding_width = "0 5";

      # background
      background_opacity = 0.90;
      background_blur = 64;
      remember_window_size = "yes";

      detect_urls = "no";
    };
  };
}