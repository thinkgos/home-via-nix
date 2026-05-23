{
  config,
  lib,
  pkgs,
  ...
}:
pkgs.writeShellApplication {
  name = "bt-popup-dropdown-terminal";
  text = builtins.readFile ./dropdown-terminal.sh;
  excludeShellChecks = [
    "SC1091"
    "SC2181"
  ];
}
