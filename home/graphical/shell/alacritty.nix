{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    # https://alacritty.org/config-alacritty.html#s3
    settings = {
      general = {
        working_directory = "None";
        live_config_reload = true;
        ipc_socket = true;
      };
      window = {
        decorations = "None";
        opacity = 0.85;
        blur = true;
        startup_mode = "Maximized";
        position = {
          x = 8;
          y = 8;
        };
        padding = {
          x = 8;
          y = 8;
        };
      };
      scrolling = {
        history = 20000;
        multiplier = 3;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        size = 10;
      };
      cursor = {
        style = "Block";
      };
    };
  };
}
