{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 设置相关脚本
  home.packages = [
    (pkgs.writeShellApplication {
      name = "bs-picker-wallpaper";
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
    (pkgs.writeShellScriptBin "bs-picker-color" (builtins.readFile ./picker-color.sh))
  ];
}
