{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 选择器
  home.packages = [
    (pkgs.writeShellApplication {
      name = "bt-picker-wallpaper";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        builtins.readFile ./picker-wallpaper.sh
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        rofi
        awww
      ];
    })
    (pkgs.writeShellScriptBin "bt-picker-color" (builtins.readFile ./picker-color.sh))
  ];
}
