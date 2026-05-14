{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 设置相关脚本
  home.packages = [
    (pkgs.writeShellScriptBin "bs-picker-wallpaper" (builtins.readFile ./picker-wallpaper.sh))
    (pkgs.writeShellScriptBin "bs-picker-color" (builtins.readFile ./picker-color.sh))
  ];
}