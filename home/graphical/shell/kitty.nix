{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kitty-themes
  ];

  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-rc";
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 10.0;
    };
    # themeFile = "Catppuccin-Mocha";
    themeFile = "Monokai_Soda";
    # themeFile = "tokyo_night_night";
    # themeFile = "noirbuddy-oxide";
    keybindings = {
      # font size
      "ctrl+shift+minus" = "change_font_size all -2.0"; # 减少字体大小
      "ctrl+-" = "change_font_size all -2.0"; # 减少字体大小
      "ctrl+shift+plus" = "change_font_size all +2.0"; # 增加字体大小
      "ctrl+=" = "change_font_size all +2.0"; # 增加字体大小
      "ctrl+0" = "change_font_size all 0"; # 重置字体大小

      # 标签页管理
      "ctrl+shift+t" = "new_tab"; # 创建标签页
      "ctrl+shift+q" = "close_tab"; # 关闭标签页
      "ctrl+page_up" = "prev_tab"; # 切换到上一个标签页
      "ctrl+shift+," = "prev_tab"; # 切换到上一个标签页
      "ctrl+page_down" = "next_tab"; # 切换到下一个标签页
      "ctrl+shift+." = "next_tab"; # 切换到下一个标签页
      "ctrl+1" = "goto_tab 1"; # 切换到第一个标签页
      "ctrl+2" = "goto_tab 2"; # 切换到第二个标签页
      "ctrl+3" = "goto_tab 3"; # 切换到第三个标签页
      "ctrl+4" = "goto_tab 4"; # 切换到第四个标签页
      "ctrl+5" = "goto_tab 5"; # 切换到第五个标签页
      "ctrl+6" = "goto_tab 6"; # 切换到第六个标签页
      "ctrl+7" = "goto_tab 7"; # 切换到第七个标签页
      "ctrl+8" = "goto_tab 8"; # 切换到第八个标签页
      "ctrl+9" = "goto_tab 9"; # 切换到第九个标签页

      # 窗口管理
      # 关闭窗口使用ctrl+d
      "ctrl+shift+e" = "launch --location=hsplit --cwd=current"; # 水平分割窗口
      "ctrl+shift+d" = "launch --location=vsplit --cwd=current"; # 垂直分割窗口
      "ctrl+shift+[" = "previous_window"; # 上一个窗口
      "ctrl+shift+left" = "previous_window"; # 上一个窗口
      "ctrl+shift+]" = "next_window"; # 下一个窗口
      "ctrl+shift+right" = "next_window"; # 下一个窗口
      "ctrl+shift+r" = "start_resizing_window"; # 调整窗口大小

      # 布局
      "f1" = "toggle_layout stack"; # 临时切换到堆栈布局
      "ctrl+shift+l" = "next_layout"; # 切换到下一个布局

    };
    settings = {
      term = "xterm-kitty";

      # layout
      enabled_layouts = "splits";

      # window
      hide_window_decorations = "titlebar-only";
      window_padding_width = "0 5";

      # tab bar
      tab_bar_edge = "top";
      tab_bar_style = "separator";
      tab_bar_min_tabs = 1;
      tab_separator = " ┇ ";
      tab_title_template = "💥 {index}.{title}";
      # tab_bar_style = "powerline";
      # tab_powerline_style = "angled";

      # background
      background_opacity = 0.90;
      background_blur = 64;
      remember_window_size = "yes";

      # cursor
      cursor_trail = 3;
      cursor_trail_decay = "0.2 0.6";
      cursor_trail_start_threshold = 2;

      detect_urls = "no";
    };
  };
}
