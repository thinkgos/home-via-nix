{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.writeShellScriptBin "blast-screen" (builtins.readFile ./screen.sh))
    (pkgs.writeShellScriptBin "blast-screen-lock" (builtins.readFile ./screen-lock.sh))
    (pkgs.writeShellScriptBin "blast-picker-color" (builtins.readFile ./picker-color.sh))
    (pkgs.writeShellScriptBin "blast-shutdown" (builtins.readFile ./shutdown.sh))
    (pkgs.writeShellScriptBin "blast-gpu-name" (builtins.readFile ./gpu-name.sh))
    (pkgs.writeShellScriptBin "blast-dropdown-terminal" (builtins.readFile ./dropdown-terminal.sh))
    (pkgs.writeShellScriptBin "blast-switch-last-workspace" (
      builtins.readFile ./switch-last-workspace.sh
    ))
    (pkgs.writeShellScriptBin "blast-toggle-waybar" (builtins.readFile ./toggle-waybar.sh))
    (pkgs.writeShellScriptBin "blast-clipboard" (builtins.readFile ./clipboard.sh))
    (pkgs.writeShellScriptBin "blast-flatpak" (builtins.readFile ./flatpak.sh))
  ];
}
