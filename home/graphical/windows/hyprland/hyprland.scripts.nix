{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.writeShellScriptBin "blast-screenshot" (builtins.readFile ./scripts/screenshot.sh))
  ];
}
