{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#agents
  cloud_conversation_storage_enabled = true; # 对话是否存储到云端 (默认: true)
  # https://docs.warp.dev/terminal/settings/all-settings/#warp-agent-ai-features
  warp_agent = {
    is_any_ai_enabled = true; # 是否启用全部 AI 功能 (默认: true)
    # https://docs.warp.dev/terminal/settings/all-settings/#input-1
    input = {
      nld_in_terminal_enabled = true; # 终端输入是否启用自然语言检测(NLD) (默认: false)
    };
    # https://docs.warp.dev/terminal/settings/all-settings/#other
    other = {
      show_agent_notifications = true; # 是否显示 Agent 通知 (默认: true)
      show_conversation_history = true; # 工具面板是否显示对话历史 (默认: true)
    };
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#third-party-cli-agents
  third_party = {
    should_render_cli_agent_toolbar = true; # 是否为 CLI Agent 命令显示底部工具栏 (默认: true)
  };
  execution_profiles = { # Agent 执行配置(profile)集合, 由 Agent Mode 与终端 Agent 共用 (默认: {})
    default = { # 名为 Default 的默认执行配置
      apply_code_diffs = "agent_decides"; # 应用代码变更(diff)的权限: agent_decides 由 Agent 自行决定
      ask_user_question = "always_ask"; # Agent 向用户提问的策略: always_ask 总是询问
      autosync_plans_to_warp_drive = true; # 计划(plans)是否自动同步到 Warp Drive
      command_allowlist = [ ]; # 免确认执行的命令白名单(正则列表)
      command_denylist = [ # 必须确认才能执行的命令黑名单(正则列表, 子 shell/网络传输/rm 等危险命令)
        ''bash(\s.*)?''
        ''fish(\s.*)?''
        ''pwsh(\s.*)?''
        ''sh(\s.*)?''
        ''zsh(\s.*)?''
        ''curl(\s.*)?''
        ''eval(\s.*)?''
        ''exec(\s.*)?''
        ''source(\s.*)?''
        ''wget(\s.*)?''
        ''dig(\s.*)?''
        ''nslookup(\s.*)?''
        ''host(\s.*)?''
        ''ssh(\s.*)?''
        ''scp(\s.*)?''
        ''rsync(\s.*)?''
        ''telnet(\s.*)?''
        ''rm(\s.*)?''
      ];
      computer_use = "never"; # 计算机使用(computer use)权限: never 禁用
      directory_allowlist = [ ]; # 免提示访问的目录白名单
      execute_commands = "always_ask"; # 执行命令的权限: always_ask 总是询问
      mcp_allowlist = [ ]; # 允许使用的 MCP 服务器白名单
      mcp_denylist = [ ]; # 禁止使用的 MCP 服务器黑名单
      mcp_permissions = "agent_decides"; # 调用 MCP 工具的权限: agent_decides 由 Agent 自行决定
      name = "Default"; # 执行配置名称
      read_files = "agent_decides"; # 读取文件的权限: agent_decides 由 Agent 自行决定
      run_agents = "always_ask"; # 启动子 Agent 的权限: always_ask 总是询问
      web_search_enabled = true; # 是否允许网络搜索
      write_to_pty = "always_ask"; # 向终端(PTY)写入的权限: always_ask 总是询问
    };
  };
}
