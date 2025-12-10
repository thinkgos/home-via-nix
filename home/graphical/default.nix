{ config, lib, pkgs, ... }: 
{
  imports = [
    ./shell
    ./editor
    ./devtools
    ./usual
  ];

  xdg = {
    enable = true;
    mime.enable = true;
  };

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "redisinsight"
      "vscode"
    ];
  };

  home.packages = with pkgs;[
    flameshot    # 截图工具
    localsend    # 局域网文件传输工具
    wireshark    # 网络协议分析工具
    vlc          # 多媒体播放器
  ];
}