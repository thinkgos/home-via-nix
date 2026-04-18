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
    hyprpwcenter # pipewire控制中心
    hyprshutdown # 关机工具
    hyprsysteminfo # 系统信息工具
  ];
  # 守护进程
  imports = [
    ./bluetooth.nix
  ];
}
