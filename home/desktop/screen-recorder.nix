{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 屏幕录制工具
  # https://github.com/SeaDve/Kooha
  home.packages = with pkgs; [
    kooha
  ];
}
