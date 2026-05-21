{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkShell =
    name: src:
    pkgs.writeShellScriptBin name ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile src}
    '';
in
{
  imports = [
    ./control/control.nix
    ./popup/popup.nix
    ./picker/picker.nix
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "blast-screen" (builtins.readFile ./screen.sh))
    (pkgs.writeShellScriptBin "blast-screen-lock" (builtins.readFile ./screen-lock.sh))
    (pkgs.writeShellScriptBin "blast-shutdown" (builtins.readFile ./shutdown.sh))
    (pkgs.writeShellScriptBin "blast-gpu-name" (builtins.readFile ./gpu-name.sh))
    (mkShell "blast-switch-last-workspace" ./switch-last-workspace.sh)
    (pkgs.writeShellScriptBin "blast-toggle-waybar" (builtins.readFile ./toggle-waybar.sh))
    (pkgs.writeShellScriptBin "blast-flatpak" (builtins.readFile ./flatpak.sh))
  ];
}
