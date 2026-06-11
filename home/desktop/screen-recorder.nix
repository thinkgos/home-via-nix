{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 屏幕录制工具
  home.packages = with pkgs; [
    #! 使用flatpak的kooha
    # kooha # https://github.com/SeaDve/Kooha
    # gpu-screen-recorder-gtk # https://git.dec05eba.com/gpu-screen-recorder-gtk/about/
  ];
}
