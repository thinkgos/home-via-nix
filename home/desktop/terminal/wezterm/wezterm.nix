{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 暂时禁用, 等到PR合并: https://github.com/wezterm/wezterm/pull/7095
  programs.wezterm = {
    enable = false;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
