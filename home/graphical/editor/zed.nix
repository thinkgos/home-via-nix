{ config, lib, pkgs, ... }: 
{
  programs.zed-editor = {
    enable = true;
    extraPackages = [];
    installRemoteServer = true;
    extensions = [
      "catppuccin-icons"
      "git-firefly"
      "markdown-oxide"
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