{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#general
  link_tooltip = true; # 悬停在链接上时是否显示工具提示 (默认: true)
  default_session_mode = "terminal"; # 新会话的默认模式: terminal/agent/cloud_agent/tab_config/docker_sandbox (默认: "terminal")
}
