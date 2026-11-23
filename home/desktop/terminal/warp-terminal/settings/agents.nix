{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#agents
  cloud_conversation_storage_enabled = true; # 对话是否存储到云端 (默认: true)
  usage_display_mode = "credits"; # CLI 用量入口的显示单位, 仅对 Warp Agent CLI 的设置文件生效: credits/cost (默认: "credits")
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
  custom_endpoints = { }; # 自定义推理端点(URL, models, schema)集合, 凭据保存在本地安全存储 (默认: {})
  # https://docs.warp.dev/terminal/settings/all-settings/#knowledge
  knowledge = {
    rules_enabled = true; # Agent 请求时是否使用已保存的规则 (默认: true)
    warp_drive_context_enabled = true; # AI 请求中是否包含 Warp Drive 上下文 (默认: true)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#mcp-servers
  mcp_servers = {
    file_based_mcp_enabled = false; # 是否自动启动第三方 Agent 的全局文件式 MCP 服务器 (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#profiles-permissions
  profiles = {
    agent_mode_coding_permissions = "always_ask_before_reading"; # Agent 读取文件的权限: always_ask_before_reading/always_allow_reading/allow_reading_specific_files (默认: "always_ask_before_reading")
    agent_mode_coding_file_read_allowlist = [ ]; # Agent 无需询问即可读取的文件路径 (默认: [])
    agent_mode_execute_readonly_commands = false; # Agent 是否可自动执行只读命令 (默认: false)
    agent_mode_command_execution_allowlist = [ # Agent 无需许可即可执行的命令白名单(正则) (默认: ["cat(\\s.*)?", "echo(\\s.*)?", "find .*", "grep(\\s.*)?", "ls(\\s.*)?", "which .*"])
      ''cat(\s.*)?''
      ''echo(\s.*)?''
      ''find .*''
      ''grep(\s.*)?''
      ''ls(\s.*)?''
      ''which .*''
    ];
    agent_mode_command_execution_denylist = [ # Agent 执行前必须询问的命令黑名单(正则) (默认: ["bash(\\s.*)?", "fish(\\s.*)?", "pwsh(\\s.*)?", "sh(\\s.*)?", "zsh(\\s.*)?", "curl(\\s.*)?", "eval(\\s.*)?", "exec(\\s.*)?", "source(\\s.*)?", "wget(\\s.*)?", "dig(\\s.*)?", "nslookup(\\s.*)?", "host(\\s.*)?", "ssh(\\s.*)?", "scp(\\s.*)?", "rsync(\\s.*)?", "telnet(\\s.*)?", "rm(\\s.*)?"])
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
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#warp-agent-ai-features
  warp_agent = {
    is_any_ai_enabled = true; # 是否启用全部 AI 功能 (默认: true)
    # https://docs.warp.dev/terminal/settings/all-settings/#active-ai
    active_ai = {
      enabled = true; # 是否启用主动 AI 功能(如建议) (默认: true)
      code_suggestions_enabled = true; # 是否启用 AI 代码建议 (默认: true)
      intelligent_autosuggestions_enabled = true; # 是否启用 AI 智能自动建议 (默认: true)
      agent_mode_query_suggestions_enabled = true; # Agent Mode 中是否显示提示建议 (默认: true)
      git_operations_autogen_enabled = true; # 代码审查对话框中是否自动生成提交信息和 PR 标题正文 (默认: true)
      rule_suggestions_enabled = true; # Agent 回复后是否建议保存规则 (默认: true)
      shared_block_title_generation_enabled = true; # 分享终端块时是否自动生成标题 (默认: true)
    };
    # https://docs.warp.dev/terminal/settings/all-settings/#input-1
    input = {
      ai_auto_detection_enabled = true; # AI 是否自动检测自然语言输入 (默认: true)
      ai_command_denylist = ""; # 排除出 AI 自然语言检测的命令 (默认: "")
      nld_in_terminal_enabled = true; # 终端输入是否启用自然语言检测(NLD) (默认: false)
      show_model_selectors_in_prompt = true; # 输入提示中是否显示 AI 模型选择器 (默认: true)
      show_agent_tips = true; # 输入中是否显示 Agent 提示 (默认: true)
      include_agent_commands_in_history = false; # Agent 执行的命令是否计入命令历史 (默认: false)
      agent_toolbar_chip_selection_setting = "default"; # Agent Mode 工具栏上下文芯片布局, 可设 "default" 或 { custom = { left = [ ]; right = [ ] } } (默认: "default")
    };
    # https://docs.warp.dev/terminal/settings/all-settings/#other
    other = {
      thinking_display_mode = "show_and_collapse"; # Agent 思考过程的显示方式: show_and_collapse/always_show/never_show (默认: "show_and_collapse")
      open_conversation_layout_preference = "new_tab"; # 打开 Agent 对话的方式: new_tab/split_pane (默认: "new_tab")
      show_conversation_history = true; # 工具面板是否显示对话历史 (默认: true)
      show_agent_notifications = true; # 是否显示 Agent 通知 (默认: true)
      should_show_oz_updates_in_zero_state = true; # Agent 视图中是否显示 "What's new" 区域 (默认: true)
      should_render_use_agent_toolbar_for_user_commands = true; # 终端命令是否显示 "Use Agent" 底栏 (默认: true)
      cloud_agent_computer_use_enabled = false; # 云端 Agent 对话是否启用计算机使用 (默认: false)
      agent_attribution_enabled = true; # Warp Agent 是否在提交和 PR 中添加署名共同作者 (默认: true)
      auto_handoff_on_sleep_enabled = false; # 电脑即将休眠时是否自动将本地对话移交云端, 仅 macOS (默认: false)
      default_prompt_submission_mode = "interrupt"; # Agent 响应中提交新提示的默认行为: interrupt/queue (默认: "interrupt")
      long_running_command_submission_mode = "queue_until_command_completes"; # Agent 执行长运行命令时提交提示的行为: send_immediately/queue_until_command_completes (默认: "queue_until_command_completes")
      orchestration_message_display_mode = "always_collapse"; # 多 Agent 运行时子 Agent 消息的显示方式: show_and_collapse/always_show/always_collapse (默认: "always_collapse")
      auto_approve_bypasses_command_denylist = true; # 自动批准和 fast forward 是否跳过命令黑名单确认 (默认: true)
      should_force_disable_cloud_handoff = false; # 是否强制禁用本地到云端的对话移交 (默认: false)
      should_force_disable_ampersand_handoff = false; # 是否强制禁用 "&" 前缀组合云端移交提示 (默认: false)
    };
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#third-party-cli-agents
  third_party = {
    should_render_cli_agent_toolbar = true; # 是否为 CLI Agent 命令显示底部工具栏 (默认: true)
    auto_toggle_composer = true; # CLI Agent 富输入框是否根据 Agent 阻塞状态自动关闭和重开 (默认: true)
    auto_open_composer_on_cli_agent_start = false; # CLI Agent 会话开始时是否自动打开富输入框 (默认: false)
    auto_dismiss_composer_after_submit = false; # 提交提示后是否自动关闭富输入框 (默认: false)
    cli_agent_toolbar_chip_selection_setting = "default"; # CLI Agent 工具栏上下文芯片布局, 可设 "default" 或 { custom = { left = [ ]; right = [ ] } } (默认: "default")
    cli_agent_toolbar_enabled_commands = { }; # 自定义工具栏命令模式到特定 CLI Agent 的映射 (默认: {})
    submit_on_ctrl_enter = false; # CLI Agent 富输入框是否用 Ctrl+Enter 提交(Enter 换行) (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#voice
  voice = {
    voice_input_enabled = true; # 是否启用 AI 语音输入 (默认: true)
    voice_input_toggle_key = "none"; # 切换语音输入的按键: none/fn/alt_left/alt_right/control_left/control_right/super_left/super_right/shift_left/shift_right (默认: "none")
    voice_input_language = ""; # 语音输入转写的首选语言, 两位 ISO 639-1 代码如 "es" (默认: "", 自动检测)
  };
}
