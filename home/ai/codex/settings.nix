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
    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = 1;
  };
  permissions = {
    # disableBypassPermissionsMode = "disable";
    # defaultMode = "acceptEdits";
    # additionalDirectories = [];
    allow = [ ];
    ask = [ ];
    deny = [ ];
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
            command = "${pkgs.rtk}/bin/rtk hook claude";
          }
        ];
      }
    ];
    PostToolUse = [ ];
  };
}
