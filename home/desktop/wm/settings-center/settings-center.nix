{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 设置
  home.packages = with pkgs; [
    blueman # 蓝牙管理器
    pavucontrol # 音量控制工具
    networkmanagerapplet # NetworkManager控制中心
  ];
  # 守护进程
  imports = [
    ./bluetooth.nix
  ];
}
