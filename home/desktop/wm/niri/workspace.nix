{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Niri 工作空间
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsworkspaces
  programs.niri.settings.workspaces = {
    "primary" = {
      open-on-output = customize.desktop.monitor-primary;
    };
    "secondary" = {
      open-on-output = customize.desktop.monitor-primary;
    };
    "flexible" = {
      open-on-output = customize.desktop.monitor-primary;
    };
    "terminal" = {
      open-on-output = customize.desktop.monitor-primary;
    };
    "standby" = {
      open-on-output = customize.desktop.monitor-primary;
    };
    # stash for niri-scratchpad
    # https://github.com/argosnothing/niri-scratchpad-rs
    # https://github.com/niri-wm/niri/pull/2997
    "stash" = {
      open-on-output = customize.desktop.monitor-primary;
    };
  };
}
