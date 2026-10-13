{
  config,
  lib,
  pkgs,
  ...
}:
{
  sandbox_mode = "workspace-write";
  model_provider = "mimo";
  model_providers = {
    mimo = {
      name = "Xiaomi MiMo";
      base_url = "https://token-plan-cn.xiaomimimo.com/v1";
      wire_api = "responses";
      env_key = "AI_MIMO_API_KEY";
    };
    deepseek = {
      name = "DeepSeek";
      base_url = "https://api.deepseek.com";
      wire_api = "responses";
      env_key = "AI_DEEPSEEK_API_KEY";
    };
  };
  # Extra settings used only when sandbox_mode = "workspace-write".
  sandbox_workspace_write = {
    network_access = true;
    exclude_tmpdir_env_var = false;
    exclude_slash_tmp = false;
  };
  desktop = {
    # General
    localeOverride = "en-US";

    defaultTerminalLocation = "bottom";
    preventSleepWhileRunning = true;
    open-in-target-preferences.global = "zed";
    # Composer
    show-context-window-usage = true;
    composerEnterBehavior = "enter";
    followUpQueueMode = "steer";
    # Notifications
    notifications-turn-mode = "unfocused";
    notifications-permissions-enabled = true;
    notifications-questions-enabled = true;
    notifications-dot-enabled = true;
    notifications-sound = "default";
    # Appearance
    appearanceTheme = "system";
    appearanceDarkCodeThemeId = "catppuccin";
    codeFontSize = 12;
    # Git
    git-pull-request-merge-method = "squash";
    git-always-force-push = false;
    git-create-pull-request-as-draft = true;
    # Git Worktrees
    worktree-auto-cleanup-enabled = true;
    worktree-upstream-refresh-mode = "best-effort";
    worktree-keep-count = 10;
  };
  features = {
    local_thread_store_compression = true;
    plugins = true;
  };
}
