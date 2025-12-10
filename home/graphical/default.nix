{ config, lib, pkgs, ... }: 
{
  imports = [
    ./shell
    ./editor
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
    redisinsight # redis 可视化工具
    dbeaver-bin  # 数据库管理工具
    # flameshot    # 截图工具
    localsend    # 局域网文件传输工具
    wireshark    # 网络协议分析工具
    vlc          # 多媒体播放器
  ];
}