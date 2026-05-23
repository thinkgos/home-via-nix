{
  config,
  lib,
  pkgs,
  ...
}:
pkgs.writeShellApplication {
  name = "bt-picker-wallpaper";
  text = ''
    source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
    ${builtins.readFile ./picker-wallpaper.sh}
  '';
  excludeShellChecks = [
    "SC1091"
    "SC2181"
  ];
  runtimeInputs = with pkgs; [
    rofi
    awww
  ];
}
