{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.writeShellScriptBin "blast-screenshot" (builtins.readFile ./screenshot.sh))
  ];
}
