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
        startup_mode = "Windowed";
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
        size = 11;
      };
      selection = {
        save_to_clipboard = true;
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };
      # https://alacritty.org/config-alacritty.html#keyboard
      keyboard = {
        bindings = [
          # 杂项
          {
            key = "-";
            mods = "Control";
            action = "DecreaseFontSize";
          }
          {
            key = "=";
            mods = "Control";
            action = "IncreaseFontSize";
          }
          {
            key = "0";
            mods = "Control";
            action = "ResetFontSize";
          }
          {
            key = "C";
            mods = "Control|Shift";
            action = "Copy";
          }
          {
            key = "V";
            mods = "Control|Shift";
            mode = "~Vi";
            action = "Paste";
          }
          {
            key = "V";
            mods = "Control|Shift";
            mode = "Vi|Search";
            action = "Paste";
          }
          {
            key = "N";
            mods = "Control|Shift";
            action = "CreateNewWindow";
          }
          {
            key = "F";
            mods = "Control|Shift";
            mode = "~Search";
            action = "SearchForward";
          }

          {
            key = "Home";
            mode = "~Alt";
            action = "ScrollToTop";
          }
          {
            key = "End";
            mode = "~Alt";
            action = "ScrollToBottom";
          }
          {
            key = "PageUp";
            mode = "~Alt";
            action = "ScrollPageUp";
          }
          {
            key = "PageDown";
            mode = "~Alt";
            action = "ScrollPageDown";
          }
          {
            key = "F11";
            action = "ToggleFullscreen";
          }
        ];
      };
    };
  };
}
