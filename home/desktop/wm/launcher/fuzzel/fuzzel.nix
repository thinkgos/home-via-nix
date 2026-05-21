{
  config,
  lib,
  pkgs,
  ...
}:
{
  # fuzzel 极致简约原生
  programs.fuzzel = {
    enable = true;
    settings = {
      # man 5 fuzzel.ini
      main = {
        anchor = "center";
        layer = "overlay";
        horizontal-pad = 16;
        vertical-pad = 8;
        font = "JetBrainsMono Nerd Font Mono:size=13";
        terminal = "${pkgs.alacritty}/bin/alacritty -e";
        prompt = ''" "'';
        placeholder = "Search...";
      };
      # Catppuccin Mocha
      # https://github.com/catppuccin/fuzzel
      # mocha-mauve
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "cba6f7ff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "cba6f7ff";
        counter = "7f849cff";
        border = "cba6f7ff";
      };
    };
  };
}
