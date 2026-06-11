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

  # Hyprland 键盘绑定
  # https://wiki.hypr.land/Configuring/Binds/
  wayland.windowManager.hyprland = {
    settings = {
      # local variable
      mod = {
        _var = "SUPER";
      };
      bind = [ ];
    };
  };
}
