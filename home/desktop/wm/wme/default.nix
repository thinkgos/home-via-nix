{
  config,
  lib,
  pkgs,
  ...
}:
{
  hyprland = import ./hyprland { inherit config lib pkgs; };
}
