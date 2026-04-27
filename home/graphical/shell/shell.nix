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
    # ./wezterm/wezterm.nix # 暂时禁用, 等到PR合并: https://github.com/wezterm/wezterm/pull/7095
  ];
}
