{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#terminal
  show_terminal_zero_state_block = false; # 新会话是否显示 AI 零状态(zero-state)块 (默认: true)
  maximum_grid_size = 20000; # 终端网格的最大行数, 含回滚缓冲 (默认: 50000)
  # https://docs.warp.dev/terminal/settings/all-settings/#input
  input = {
    alias_expansion_enabled = false; # 输入时是否展开 shell 别名 (默认: false)
    honor_ps1 = false; # 是否使用 shell 的 PS1 提示符而非 Warp 输入框 (默认: false)
    input_box_type_setting = "universal"; # 输入框样式: universal(AI 优先)/classic(终端优先) (默认: "classic")
  };
}
