{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 运行脚本
  home.packages = [
    (pkgs.writeShellApplication {
      name = "bt-run-flatpak";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./flatpak.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      # runtimeInputs = with pkgs; [ ];
    })
  ];
}
