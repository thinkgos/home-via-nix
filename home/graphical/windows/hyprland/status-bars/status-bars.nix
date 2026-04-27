{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./waybar/waybar.nix
  ];
}
