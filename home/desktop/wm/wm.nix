{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  wme = import ./wme { inherit config lib pkgs; };
in
{
  _module.args = {
    wme = wme.${customize.desktop.window};
  };

  imports = [
    ./components/components.nix # 组件库
  ]
  ++ lib.optional (customize.desktop.window == "hyprland") ./hyprland/hyprland.nix
  ++ lib.optional (customize.desktop.window == "niri") ./niri/niri.nix;
}
