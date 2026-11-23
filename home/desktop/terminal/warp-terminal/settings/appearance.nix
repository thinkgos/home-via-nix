{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#appearance
  #
  # https://docs.warp.dev/terminal/settings/all-settings/#themes
  themes = {
    system_theme = false; # 是否跟随系统明暗主题 (默认: false)
    theme = "dark"; # 配色主题, 支持内置主题名或自定义主题 (默认: "dark")
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#text
  text = {
    match_notebook_to_monospace_font_size = true; # Notebook 字号是否与终端字号保持一致 (默认: true)
    notebook_font_size = 14.0; # Notebook 字体大小, 字号未与终端一致时生效 (默认: 14.0)
    font_size = 13.0; # 终端字体大小 (默认: 13.0)
    font_name = "JetBrainsMono Nerd Font Mono"; # 终端使用的等宽字体 (默认: "Hack")
    match_ai_font = true; # AI 字体是否自动与终端字体保持一致 (默认: false)
    ai_font_name = "JetBrainsMono Nerd Font Mono"; # AI 生成内容使用的字体, 字体未与终端一致时生效 (默认: "Hack")
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#cursor
  cursor = {
    cursor_display_type = "bar"; # 光标样式: bar 竖线/block 方块/underline 下划线 (默认: "bar")
    cursor_blink = "enabled"; # 光标是否闪烁: enabled/disabled (默认: "enabled")
  };
  spacing = "compact"; # 终端块之间的间距: normal/compact (默认: "normal")
  # https://docs.warp.dev/terminal/settings/all-settings/#vertical-tabs
  vertical_tabs = {
    enabled = false; # 是否以垂直方式显示标签页, 替代顶部水平标签栏 (默认: false)
    display_granularity = "tabs"; # 垂直标签面板每行的粒度: tabs 按标签/panes 按面板 (默认: "panes")
    view_mode = "compact"; # 垂直标签栏显示模式: compact/expanded (默认: "compact")
    show_details_on_hover = true; # 悬停垂直标签时是否显示详情侧栏 (默认: true)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#window
  window = {
    open_windows_at_custom_size = false; # 新窗口是否以自定义尺寸打开, 否则使用默认尺寸 (默认: false)
    override_opacity = 65; # 窗口背景不透明度, 范围 1-100 (默认: 100)
    new_windows_num_rows = 40; # 自定义尺寸时新窗口的行数 (默认: 40)
    new_windows_num_columns = 80; # 自定义尺寸时新窗口的列数 (默认: 80)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#panes
  panes = {
    focus_pane_on_hover = false; # 悬停时是否自动聚焦对应面板 (默认: false)
    should_dim_inactive_panes = true; # 是否将非活动面板调暗 (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#full-screen-apps
  full_screen_apps = {
    alt_screen_padding = { # 全屏终端应用(备用屏幕)周围的内边距 (默认: { custom = { uniform_padding = 0.0 } })
      custom = { # 自定义内边距
        uniform_padding = 0.0; # 四周统一内边距 (默认: 0.0)
      };
    };
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#tabs
  tabs = {
    tab_close_button_position = "right"; # 标签关闭按钮位置: right/left (默认: "right")
    show_indicators_button = false; # 是否在标签上显示活动指示器 (默认: true)
    workspace_decoration_visibility = "hide_fullscreen"; # 工作区装饰(标签栏等)的可见性: always_show/hide_fullscreen/on_hover (默认: "hide_fullscreen")
  };

  # https://docs.warp.dev/terminal/settings/all-settings/#input-position
  input = {
    input_mode = "waterfall"; # 终端输入框位置: pinned_to_bottom/pinned_to_top/waterfall 跟随命令 (默认: "pinned_to_bottom")
  };
}
