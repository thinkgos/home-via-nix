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

  # https://sw.kovidgoyal.net/kitty/conf/#kitty-conf
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-rc";
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 11.0;
    };
    themeFile = "Catppuccin-Mocha";
    # themeFile = "Monokai_Soda";
    # themeFile = "noirbuddy-oxide";
    keybindings = {
      # font size
      "ctrl+-" = "change_font_size all -2.0"; # 减少字体大小
      "ctrl+=" = "change_font_size all +2.0"; # 增加字体大小
      "ctrl+0" = "change_font_size all 0"; # 重置字体大小

      # 标签页管理
      "ctrl+shift+t" = "new_tab"; # 新建标签页
      "ctrl+shift+w" = "close_tab"; # 关闭标签页
      "ctrl+page_up" = "prev_tab"; # 聚焦左边标签页
      "ctrl+page_down" = "next_tab"; # 聚焦右边标签页
      "ctrl+shift+tab" = "prev_tab"; # 聚焦左边标签页
      "ctrl+tab" = "next_tab"; # 聚焦右边标签页
      "ctrl+1" = "goto_tab 1"; # 聚焦标签页1
      "ctrl+2" = "goto_tab 2"; # 聚焦标签页2
      "ctrl+3" = "goto_tab 3"; # 聚焦标签页3
      "ctrl+4" = "goto_tab 4"; # 聚焦标签页4
      "ctrl+5" = "goto_tab 5"; # 聚焦标签页5
      "ctrl+6" = "goto_tab 6"; # 聚焦标签页6
      "ctrl+7" = "goto_tab 7"; # 聚焦标签页7
      "ctrl+8" = "goto_tab 8"; # 聚焦标签页8
      "ctrl+9" = "goto_tab 9"; # 聚焦标签页9

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
      font_features = "JetBrainsMono-Regular +zero +cv02 +cv03 +cv04 +cv10 +cv11 +cv12 +cv18 +cv20";

      term = "xterm-kitty";

      copy_on_select = "clipboard";

      # layout
      enabled_layouts = "splits";

      # window
      hide_window_decorations = "titlebar-only";
      window_padding_width = "0 5";

      # tab bar
      tab_bar_edge = "top";
      tab_bar_style = "separator";
      tab_separator = " ┇ ";
      tab_title_template = "💥 {index}.{title}";
      # tab_bar_min_tabs = 1;
      # tab_bar_style = "powerline";
      # tab_powerline_style = "angled";

      # background
      background_opacity = 0.85;
      background_blur = 0;
      remember_window_size = "yes";

      # cursor
      cursor_trail = 3;
      cursor_trail_decay = "0.2 0.6";
      cursor_trail_start_threshold = 2;

      detect_urls = "no";
    };
  };
}
