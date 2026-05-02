{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./pointer-cursor.nix
    ./i18n.nix
    ./password-store.nix
    ./email.nix
    ./screen-recorder.nix
    ./screenshot.nix
    ./terminal/terminal.nix
    ./editor/editor.nix
    ./programs/programs.nix
  ]
  ++ lib.optional (customize.desktop.window == "gnome") ./gnome/gnome.nix
  ++ lib.optional (customize.desktop.window == "hyprland") ./hyprland/hyprland.nix;
}
