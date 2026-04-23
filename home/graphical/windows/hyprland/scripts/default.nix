{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.writeShellScriptBin "blast-screenshot" (builtins.readFile ./screenshot.sh))
    (pkgs.writeShellScriptBin "blast-shutdown" (builtins.readFile ./shutdown.sh))
    (pkgs.writeShellScriptBin "blast-lock-screen" (builtins.readFile ./lock-screen.sh))
    (pkgs.writeShellScriptBin "blast-gpu-name" (builtins.readFile ./gpu-name.sh))
    (pkgs.writeShellScriptBin "blast-dropdown-terminal" (builtins.readFile ./dropdown-terminal.sh))
  ];
}
