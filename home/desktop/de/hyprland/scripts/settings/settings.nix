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
      text = builtins.readFile ./picker-wallpaper.sh;
      runtimeInputs = with pkgs; [
        rofi
        awww
      ];
    })
    (pkgs.writeShellScriptBin "bs-picker-color" (builtins.readFile ./picker-color.sh))
  ];
}
