{
  config,
  lib,
  pkgs,
  ...
}:
{
  # vicinae 应用启动器
  # https://docs.vicinae.com/
  # https://www.vicinae.com/extensions
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    extensions = [ ];
    settings = {
      close_on_focus_loss = false;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "google";
      search_files_in_root = true;
      font = {
        rendering = "native";
        normal = {
          size = 11;
          family = "JetBrainsMono Nerd Font Mono";
        };
      };
      theme = {
        light = {
          name = "vicinae-light";
          icon_theme = "auto";
        };
        dark = {
          name = "catppuccin-mocha";
          icon_theme = "Catppuccin Latte Mauve";
        };
      };
      launcher_window = {
        opacity = 0.70;
        layer_shell = {
          enabled = false;
        };
      };
    };
    # themes = {};
  };
}
