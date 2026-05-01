{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = [ ];
    installRemoteServer = true;
    extensions = [
      "catppuccin-icons"
      "one-dark-pro-enhanced"
      "git-firefly"
      "ini"
      "toml"
      "xml"
      "json5"
      "kdl"
      "csv"
      "dockerfile"
      "sql"
      "make"
      "markdown-oxide"
      "proto"
      "lua"
      "nix"
    ];
    # themes = {};
    # mutableUserDebug = true;
    # mutableUserKeymaps = true;
    # mutableUserSettings = true;
    # mutableUserTasks = true;
    # userDebug = {};
    # userKeymaps = {};
    # userSettings = {};
    # userTasks = {};
  };
}
