{
  config,
  lib,
  pkgs,
  ...
}:
pkgs.writeShellApplication {
  name = "bt-popup-clipboard";
  text = ''
    source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
    ${builtins.readFile ./clipboard.sh}
  '';
  excludeShellChecks = [
    "SC1091"
    "SC2181"
  ];
  runtimeInputs = with pkgs; [
    cliphist
    fuzzel
    wl-clipboard
  ];
}
