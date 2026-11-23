{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#terminal
  copy_on_select = true; # 选中文本时是否自动复制到剪贴板 (默认: true)
  focus_reporting_enabled = true; # 是否向全屏终端应用转发焦点和失焦事件 (默认: true)
  mouse_reporting_enabled = true; # 是否向全屏终端应用转发鼠标事件 (默认: true)
  scroll_reporting_enabled = true; # 是否向全屏终端应用转发滚动事件 (默认: true)
  maximum_grid_size = 20000; # 终端网格的最大行数, 含回滚缓冲 (默认: 50000)
  osc52_clipboard_access = "deny"; # 终端程序通过 OSC 52 转义序列访问系统剪贴板: deny/write_only/read_write (默认: "deny")
  use_audible_bell = true; # 终端响铃事件时是否播放提示音 (默认: false)
  show_terminal_zero_state_block = false; # 新会话是否显示 AI 零状态(zero-state)块 (默认: true)
  # https://docs.warp.dev/terminal/settings/all-settings/#input
  input = {
    syntax_highlighting = true; # 终端输入是否启用语法高亮 (默认: true)
    honor_ps1 = false; # 是否使用 shell 的 PS1 提示符而非 Warp 输入框 (默认: false)
    input_box_type_setting = "classic"; # 输入框样式: universal(AI 优先)/classic(终端优先) (默认: "classic")
    alias_expansion_enabled = false; # 输入时是否展开 shell 别名 (默认: false)
    command_corrections = true; # 是否为拼错的命令提供纠正建议 (默认: true)
    error_underlining_enabled = true; # 是否在输入中给命令错误加下划线 (默认: true)
    completions_open_while_typing = false; # 输入时是否自动打开补全菜单 (默认: false)
    classic_completions_mode = false; # 是否启用经典补全模式 (默认: false)
    warp_completions_enabled = true; # 是否显示 Warp 内置的 shell 命令补全 (默认: true)
    native_shell_completions_enabled = true; # 是否使用 shell 自身的补全, 与 Warp 内置补全可同时开启 (默认: true)
    show_hint_text = true; # 终端输入中是否显示提示文本 (默认: true)
    show_terminal_input_message_bar = true; # 是否显示终端输入消息栏 (默认: true)
    enable_slash_commands_in_terminal = true; # 终端输入中是否可用斜杠命令 (默认: true)
    at_context_menu_in_terminal_mode = true; # 终端模式下是否可用 @ 上下文菜单 (默认: true)
    enable_ai_command_search_hash_trigger = true; # 输入开头键入 "#" 是否打开命令搜索 (默认: true)
    outline_codebase_symbols_for_at_context_menu = true; # @ 上下文菜单中是否列出代码库符号 (默认: true)
    middle_click_paste_enabled = true; # 中键点击是否粘贴剪贴板内容 (默认: true)
    right_click_behavior = "context_menu"; # 终端中右键行为: context_menu/paste (默认: "context_menu")
    extra_meta_keys = {
      left_alt = false;
      right_alt = false;
    }; # 额外视为 meta 键的按键 (默认: { left_alt = false, right_alt = false })
    # https://docs.warp.dev/terminal/settings/all-settings/#autosuggestions
    autosuggestions = {
      enabled = true; # 是否显示命令自动建议 (默认: true)
      keybinding_hint = true; # 是否显示自动建议的快捷键提示 (默认: true)
      show_ignore_button = false; # 是否显示自动建议的忽略按钮 (默认: false)
    };
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#smart-select
  smart_select = {
    enabled = true; # 双击智能选择 URL/邮箱/文件路径/标识符是否启用 (默认: true)
    word_char_allowlist = "-.~/\\"; # 关闭智能选择时视为单词一部分的字符 (默认: "-.~/\\")
  };
}
