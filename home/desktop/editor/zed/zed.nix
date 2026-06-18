{
  config,
  lib,
  pkgs,
  ...
}:
let
  user_settings = import ./user-settings { inherit config lib pkgs; };
in
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    installRemoteServer = true;
    defaultEditor = false;
    extraPackages = with pkgs; [
      rustup
      nixd
    ];
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
      "glsl"
    ];
    # 用户debug配置(debug.json)可以被zed更新
    # https://zed.dev/docs/debugger
    mutableUserDebug = true;
    # userDebug = {};
    # 用户keymaps配置(keymaps.json)可以被zed更新
    mutableUserKeymaps = true;
    # userKeymaps = {};
    # 用户settings配置(settings.json)可以被zed更新
    # https://zed.dev/docs/reference/all-settings
    mutableUserSettings = true;
    # enableMcpIntegration = false;
    userSettings = user_settings;
    # 用户tasks配置(tasks.json)可以被zed更新
    mutableUserTasks = true;
    # userTasks = {};
    # 自定义theme
    # themes = {};
  };
}
