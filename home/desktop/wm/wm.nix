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
    # hyprland, niri, gnome(Deprecated)
    ./${customize.desktop.window}
  ]
  ++ lib.optional (
    customize.desktop.window == "hyprland" || customize.desktop.window == "niri"
  ) ./components/components.nix; # 组件库
}
