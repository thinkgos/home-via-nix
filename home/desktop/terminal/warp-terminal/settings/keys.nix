{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#keys
  ctrl_tab_behavior_setting = "activate_prev_next_tab"; # Ctrl+Tab 的行为: activate_prev_next_tab/cycle_most_recent_session/cycle_most_recent_tab (默认: "activate_prev_next_tab")
}
