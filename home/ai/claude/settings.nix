{
  config,
  lib,
  pkgs,
  ...
}:
{
  includeCoAuthoredBy = false;
  theme = "dark-ansi";
  # statusLine = { };
  env = {
    # ANTHROPIC_AUTH_TOKEN = "";
    # ANTHROPIC_BASE_URL = "";
    # ANTHROPIC_MODEL = "";
    # ANTHROPIC_DEFAULT_HAIKU_MODEL = "";
    # ANTHROPIC_DEFAULT_HAIKU_MODEL_NAME = "";
    # ANTHROPIC_DEFAULT_OPUS_MODEL = "";
    # ANTHROPIC_DEFAULT_OPUS_MODEL_NAME = "";
    # ANTHROPIC_DEFAULT_SONNET_MODEL = "";
    # ANTHROPIC_DEFAULT_SONNET_MODEL_NAME = "";
    API_TIMEOUT_MS = "300000";
    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1";
  };
  permissions = {
    # disableBypassPermissionsMode = "disable";
    # defaultMode = "acceptEdits";
    # additionalDirectories = [];
    allow = [
      "Bash(* --version)"
      "Bash(* --help *)"
      "Bash(date *)"
      "Bash(echo *)"
      "Bash(cat *)"
      "Bash(ls *)"
      "Bash(mkdir *)"
      "Bash(wc *)"
      "Bash(head *)"
      "Bash(tail *)"
      "Bash(sort *)"
      "Bash(grep *)"
      "Bash(tr *)"
      "Bash(curl *)"
      "Bash(rtk *)"
      "Bash(codegraph *)"
      "Bash(git add *)"
      "Bash(git status *)"
      "Bash(git log *)"
      "Bash(git diff *)"
      "Bash(git show *)"
      "Bash(git branch *)"
      "WebSearch"

      # mcp
      # codegraph
      "Plugin:claude-code-home-manager:codegraph"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__explore"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__search"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__node"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__callers"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__callees"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__impact"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__files"
      "mcp__plugin_claude-code-home-manager_codegraph__codegraph__status"
    ];
    ask = [
      "Bash(git commit *)"
      "Bash(git tag *)"
      "Bash(git push *)"
    ];
    deny = [ ];
  };
  statusLine = {
    type = "command";
    command = "ccometixline";
    padding = 0;
  };
  enabledPlugins = {
    "claude-md-management@claude-plugins-official" = true;
    "code-simplifier@claude-plugins-official" = true;
    "context7@claude-plugins-official" = true;
    "skill-creator@claude-plugins-official" = true;
  };
  hooks = {
    SessionStart = [ ];
    PreToolUse = [
      {
        matcher = "Bash";
        hooks = [
          {
            type = "command";
            command = "rtk hook claude";
          }
        ];
      }
    ];
    PostToolUse = [ ];
  };
}
