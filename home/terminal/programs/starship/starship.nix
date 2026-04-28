{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    presets = [ "nerd-font-symbols" ];
    settings = builtins.fromTOML (builtins.readFile ./catppuccin-powerline.toml);
  };
}
