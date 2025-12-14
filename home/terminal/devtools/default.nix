{ config, lib, pkgs, ... }: 
{
  imports = [
    ./rust.nix
  ];

  home.packages = with pkgs;[
    # mise    # 管理开发环境, 软件多版本管理

    # 编译工具
    autoconf    # 自动配置工具
    gnumake     # 构建工具
    cmake       # 跨平台构建工具
    sccache     # 缓存编译结果
    mold        # 快速编译链接器
    upx         # 二进制压缩工具

    #! 数据库工具
    sqlite          # sqlite数据库工具
    sqlcipher       # sqlite数据库工具, 支持加密
    mysql84         # mysql数据库工具
    mycli           # mysql客户端
  ];
  programs = {
    mise = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}