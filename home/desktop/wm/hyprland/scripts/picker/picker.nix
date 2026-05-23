{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 选择器
  home.packages = [
    pkgs.hwn
    (pkgs.writeShellScriptBin "bt-picker-color" (builtins.readFile ./picker-color.sh))
  ];
}
