{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#session
  # startup_shell_override 未设置时使用系统默认 shell, 可选 "bash"/"zsh"/"fish"/"pwsh" 或自定义命令/路径 (默认: null)
  new_session_shell_override = "system_default"; # 新会话使用的 shell: "system_default"/{ executable = "/path/to/shell" }/{ custom = "command" } (默认: null, 即系统默认)
  # https://docs.warp.dev/terminal/settings/all-settings/#working-directory-config
  working_directory_config = {
    advanced_mode = false; # 是否按会话来源分别配置工作目录, 否则 global 对所有来源生效 (默认: false)
    global = { # advanced_mode 为 false 时对所有来源生效
      mode = "previous_dir"; # 工作目录确定方式: home_dir/previous_dir/custom_dir (默认: "previous_dir")
      custom_dir = ""; # mode 为 "custom_dir" 时的自定义目录 (默认: "")
    };
    split_pane = { # 分屏会话的工作目录, 仅 advanced_mode 为 true 时生效
      mode = "previous_dir"; # 同 global.mode (默认: "previous_dir")
      custom_dir = ""; # 同 global.custom_dir (默认: "")
    };
    new_tab = { # 新标签页会话的工作目录, 仅 advanced_mode 为 true 时生效
      mode = "previous_dir"; # 同 global.mode (默认: "previous_dir")
      custom_dir = ""; # 同 global.custom_dir (默认: "")
    };
    new_window = { # 新窗口会话的工作目录, 仅 advanced_mode 为 true 时生效
      mode = "previous_dir"; # 同 global.mode (默认: "previous_dir")
      custom_dir = ""; # 同 global.custom_dir (默认: "")
    };
  };
}
