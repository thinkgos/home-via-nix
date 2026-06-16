{
  config,
  lib,
  pkgs,
  ...
}:
let
  font_feature = {
    "zero" = true;
    "cv02" = true;
    "cv03" = true;
    "cv04" = true;
    "cv10" = true;
    "cv11" = true;
    "cv12" = true;
    "cv18" = true;
    "cv20" = true;
  };
in
{
  programs.zed-editor = {
    enable = true;
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
    # themes = {};
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
    userSettings = {
      project_panel = {
        dock = "left";
      };
      git_panel = {
        dock = "left";
      };
      agent = {
        dock = "right";
      };
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "One Dark Pro Night Flat";
      };
      icon_theme = "Catppuccin Latte";
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 15.0;
      ui_font_features = font_feature;
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      buffer_font_size = 16.0;
      buffer_line_height = "standard";
      buffer_font_features = font_feature;
      # 终端配置
      terminal = {
        copy_on_select = true;
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 15.0;
        font_features = font_feature;
      };
      colorize_brackets = true;
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      languages = {
        "Nix" = {
          language_servers = ["nixd" "!nil"];
        };
      };
    };
    # 用户tasks配置(tasks.json)可以被zed更新
    mutableUserTasks = true;
    # userTasks = {};
  };
}
