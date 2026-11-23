{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#appearance
  spacing = "compact"; # 终端块之间的间距: normal/compact (默认: "normal")
  # https://docs.warp.dev/terminal/settings/all-settings/#themes
  themes = {
    theme = "dark"; # 配色主题, 支持内置主题名或自定义主题 { custom = { name = "..."; path = "..." } } (默认: "dark")
    system_theme = true; # 是否跟随系统明暗主题 (默认: false)
    selected_system_themes = {
      dark = "dark";
      light = "light";
    }; # 跟随系统主题时明暗模式使用的主题 (默认: { dark = "dark", light = "light" })
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#text
  text = {
    font_name = "JetBrainsMono Nerd Font Mono"; # 终端使用的等宽字体 (默认: "Hack")
    font_size = 13.0; # 终端字体大小 (默认: 13.0)
    font_weight = "normal"; # 字体粗细: thin/extra_light/light/normal/medium/semibold/bold/extra_bold/black (默认: "normal")
    line_height_ratio = 1.2; # 终端文本的行高比例 (默认: 1.2)
    ligature_rendering_enabled = false; # 是否渲染字体连字(ligatures) (默认: false)
    ai_font_name = "JetBrainsMono Nerd Font Mono"; # AI 生成内容使用的字体, 字体未与终端一致时生效 (默认: "Hack")
    match_ai_font = true; # AI 字体是否自动与终端字体保持一致 (默认: false)
    notebook_font_size = 14.0; # Notebook 字体大小, 字号未与终端一致时生效 (默认: 14.0)
    match_notebook_to_monospace_font_size = true; # Notebook 字号是否与终端字号保持一致 (默认: true)
    use_thin_strokes = "on_high_dpi_displays"; # 字体描边粗细, 仅 macOS: never/on_low_dpi_displays/on_high_dpi_displays/always (默认: "on_high_dpi_displays")
    enforce_minimum_contrast = "only_named_colors"; # 是否强制文本最低对比度: never/only_named_colors/always (默认: "only_named_colors")
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#cursor
  cursor = {
    cursor_display_type = "bar"; # 光标样式: bar 竖线/block 方块/underline 下划线 (默认: "bar")
    cursor_blink = "enabled"; # 光标是否闪烁: enabled/disabled (默认: "enabled")
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#blocks
  blocks = {
    show_block_dividers = true; # 是否显示终端块之间的分隔线 (默认: true)
    show_jump_to_bottom_of_block_button = true; # 长命令输出中是否显示跳到底部按钮 (默认: true)
    should_show_bootstrap_block = false; # 是否显示 bootstrap 块 (默认: false)
    should_show_in_band_command_blocks = false; # 是否显示带内(in-band)命令块 (默认: false)
    should_show_ssh_block = false; # 是否显示 SSH 连接块 (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#tabs
  tabs = {
    workspace_decoration_visibility = "hide_fullscreen"; # 工作区装饰(标签栏等)的可见性: always_show/hide_fullscreen/on_hover (默认: "hide_fullscreen")
    tab_close_button_position = "right"; # 标签关闭按钮位置: right/left (默认: "right")
    show_indicators_button = true; # 是否在标签上显示活动指示器 (默认: true)
    preserve_active_tab_color = false; # 切换标签时是否保留活动标签的颜色 (默认: false)
    directory_tab_colors = { }; # 目录路径到标签颜色的映射, 通过按目录分配标签颜色时填充 (默认: {})
    header_toolbar_chip_selection = "default"; # 垂直标签面板头部工具栏芯片布局, 可设 "default" 或 { custom = { left = [ ]; right = [ ] } } (默认: "default")
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#vertical-tabs
  vertical_tabs = {
    enabled = false; # 是否以垂直方式显示标签页, 替代顶部水平标签栏 (默认: false)
    view_mode = "compact"; # 垂直标签栏显示模式: compact/expanded (默认: "compact")
    primary_info = "command"; # 垂直标签显示的主要信息: command/working_directory/branch (默认: "command")
    compact_subtitle = "branch"; # 紧凑垂直标签的副标题: branch/working_directory/command (默认: "branch")
    display_granularity = "tabs"; # 垂直标签面板每行的粒度: tabs 按标签/panes 按面板 (默认: "panes")
    tab_item_mode = "focused_session"; # 垂直标签的显示模式: focused_session/summary (默认: "focused_session")
    show_details_on_hover = true; # 悬停垂直标签时是否显示详情侧栏 (默认: true)
    show_diff_stats = true; # 垂直标签上是否显示 diff 统计 (默认: true)
    show_pr_link = true; # 垂直标签上是否显示 PR 链接 (默认: true)
    use_latest_prompt_as_title = false; # Agent 对话的垂直标签名是否使用最新用户提示 (默认: false)
    hide_title_bar_search_bar = false; # 使用垂直标签布局时是否隐藏标题栏搜索框 (默认: false)
    show_panel_in_restored_windows = false; # 恢复的窗口是否打开垂直标签面板 (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#panes
  panes = {
    focus_pane_on_hover = false; # 悬停时是否自动聚焦对应面板 (默认: false)
    should_dim_inactive_panes = true; # 是否将非活动面板调暗 (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#input-position
  input = {
    input_mode = "waterfall"; # 终端输入框位置: pinned_to_bottom/pinned_to_top/waterfall 跟随命令 (默认: "pinned_to_bottom")
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#full-screen-apps
  full_screen_apps = {
    alt_screen_padding = {
      # 全屏终端应用(备用屏幕)周围的内边距 (默认: { custom = { uniform_padding = 0.0 } })
      custom = {
        # 自定义内边距
        uniform_padding = 0.0; # 四周统一内边距 (默认: 0.0)
      };
    };
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#icon
  icon = {
    app_icon = "default"; # 应用图标: default/aurora/classic1/classic2/classic3/comets/cow/glass_sky/glitch/glow/holographic/mono/neon/original/starburst/sticker/warp_one (默认: "default")
    show_dock_icon = true; # 是否在 macOS Dock 和 Cmd+Tab 中显示, 仅 macOS (默认: true)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#window
  window = {
    override_opacity = 65; # 窗口背景不透明度, 范围 1-100 (默认: 100)
    override_blur = 1; # 窗口背景的模糊半径, 仅 macOS (默认: 1)
    backdrop = "none"; # 不透明度低于 100 时的系统背景材质, 仅 Windows: none/mica/acrylic/mica_alt (默认: "none")
    override_blur_texture = false; # 已废弃, 请改用 backdrop; backdrop 未设置时 true 迁移为 "acrylic", 仅 Windows (默认: false)
    zoom_level = 100; # 窗口缩放级别百分比 (默认: 100)
    open_windows_at_custom_size = false; # 新窗口是否以自定义尺寸打开, 否则使用默认尺寸 (默认: false)
    new_windows_num_columns = 80; # 自定义尺寸时新窗口的列数 (默认: 80)
    new_windows_num_rows = 40; # 自定义尺寸时新窗口的行数 (默认: 40)
    left_panel_visibility_across_tabs = true; # 左侧面板的可见性是否跨所有标签共享 (默认: true)
  };
}
