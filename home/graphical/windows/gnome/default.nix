{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./gnome-dconf.nix
    ./gnome-shell-extensions.nix
    ./app-launchers.nix
  ];
}
