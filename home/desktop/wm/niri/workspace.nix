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
    # "name" = {
    #   name = "";
    #   open-on-output = "";
    # };
    "primary" = { };
    "secondary" = { };
    "flexible" = { };
    "terminal" = { };
    # stash for niri-scratchpad
    # https://github.com/argosnothing/niri-scratchpad-rs
    # https://github.com/niri-wm/niri/pull/2997
    "stash" = { };
  };
}
