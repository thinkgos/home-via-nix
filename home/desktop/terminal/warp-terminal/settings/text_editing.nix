{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#text-editing
  code_editor_line_number_mode = "absolute"; # 代码编辑器行号显示方式: absolute/relative (默认: "absolute")
  vim_mode_enabled = false; # 是否启用 Vim 键位绑定 (默认: false)
  vim_status_bar = true; # 是否显示 Vim 状态栏 (默认: true)
  vim_unnamed_system_clipboard = false; # Vim 未命名寄存器是否使用系统剪贴板 (默认: false)
  autocomplete_symbols = true; # 是否自动补全括号和引号等配对符号 (默认: true)
}
