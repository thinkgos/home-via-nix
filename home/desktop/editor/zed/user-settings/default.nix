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
  # 默认配置: https://github.com/zed-industries/zed/blob/main/assets/settings/default.json
  project_panel = {
    dock = "left";
  };
  outline_panel = {
    dock = "left";
  };
  git_panel = {
    dock = "left";
  };
  search = {
    button = false;
  };
  diagnostics = {
    dock = "left";
    inline = {
      enabled = true;
    };
  };
  agent = {
    dock = "right";
  };
  debugger = {
    dock = "bottom";
  };
  theme = {
    mode = "dark";
    light = "One Light";
    dark = "One Dark Pro Night Flat";
  };
  icon_theme = {
    mode = "system";
    light = "Catppuccin Latte";
    dark = "Catppuccin Latte";
  };
  ui_font_family = "JetBrainsMono Nerd Font";
  ui_font_size = 15.0;
  ui_font_features = font_feature;
  buffer_font_family = "JetBrainsMono Nerd Font Mono";
  buffer_font_size = 16.0;
  buffer_line_height = "standard";
  buffer_font_features = font_feature;
  # 终端配置
  terminal = {
    font_family = "JetBrainsMono Nerd Font Mono";
    font_size = 15.0;
    line_height = "standard";
    font_features = font_feature;
    cursor_shape = "bar";
    blinking = "on";
    copy_on_select = true;
  };
  colorize_brackets = true;
  autosave = {
    after_delay = {
      milliseconds = 1000;
    };
  };
  inlay_hints = {
    enabled = true;
  };
  code_lens = "on";
  languages = import ./languages.nix { inherit config lib pkgs; };
  lsp = import ./lsp.nix { inherit config lib pkgs; };
}
