{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  wmpkgs = pkgs.callPackage ./packages { inherit customize; };
in
{
  imports = [
    # hyprland, niri, gnome(Deprecated)
    ./${customize.desktop.window}
  ]
  ++ lib.optional (
    customize.desktop.window == "hyprland" || customize.desktop.window == "niri"
  ) ./components/components.nix; # 组件库

  home.packages =
    with pkgs;
    [
      wlrctl # wayland扩展命令行工具
      wlopm # wayland电源管理工具

      hvn
    ]
    ++ (with wmpkgs; [
      wl-active-window
    ]);
}
