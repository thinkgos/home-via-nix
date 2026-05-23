{
  config,
  lib,
  pkgs,
  ...
}:
{
  hyprland = import ./hyprland { inherit config lib pkgs; };
  niri = import ./niri { inherit config lib pkgs; };
}
