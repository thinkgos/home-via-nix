{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./system.nix
    ./launcher.nix
    ./screenshot.nix
    ./mouse.nix
    ./layout.nix
    ./workspace.nix
    ./window.nix
    ./function-key.nix
  ];

  programs.niri.settings.binds = { };
}
