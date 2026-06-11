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
    "1" = {
      name = "primary";
      open-on-output = customize.desktop.monitor-primary;
    };
    "2" = {
      name = "secondary";
      open-on-output = customize.desktop.monitor-primary;
    };
    "3" = {
      name = "flexible";
      open-on-output = customize.desktop.monitor-primary;
    };
    "4" = {
      name = "terminal";
      open-on-output = customize.desktop.monitor-primary;
    };
    "5" = {
      name = "standby";
      open-on-output = customize.desktop.monitor-primary;
    };
    "stash" = {
      name = "stash";
      open-on-output = customize.desktop.monitor-primary;
    };
  };
}
