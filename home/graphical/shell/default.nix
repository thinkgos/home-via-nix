{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./wezterm.nix # 暂时禁用, 等到PR合并: https://github.com/wezterm/wezterm/pull/7095
    ./kitty.nix
    ./ghostty.nix
  ];
}
