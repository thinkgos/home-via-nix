{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.sessionVariables = {
    TERMINFO_DIRS = "${pkgs.ghostty}/share/terminfo:${pkgs.kitty.terminfo}/share/terminfo:$TERMINFO_DIRS";
  };

  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./ghostty.nix
    ./wezterm/wezterm.nix
  ];
}
