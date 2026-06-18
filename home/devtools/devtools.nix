{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports =
    [ ]
    ++ lib.optional (builtins.elem "rust" customize.lang) ./rust.nix
    ++ lib.optional (builtins.elem "go" customize.lang) ./go.nix
    ++ lib.optional (builtins.elem "cpp" customize.lang) ./cpp.nix
    ++ lib.optional (builtins.elem "python" customize.lang) ./python.nix;

  home.packages = with pkgs; [
    # mise    # 管理开发环境, 软件多版本管理

    #! 通用
    taplo # toml 工具
    nfpm # a simple deb, rpm, apk, ipk, and arch linux packager

    #! 编译工具
    autoconf # 自动配置工具
    gnumake # 构建工具
    cmake # 跨平台构建工具
    pkg-config # 库的配置工具
    sccache # 缓存编译结果
    kache # 缓存编译结果
    mold # 快速编译链接器
    upx # 二进制压缩工具
    valgrind # 调试和分析工具
    perf # 性能分析工具

    #! 数据库工具
    sqlite # sqlite数据库工具
    sqlcipher # sqlite数据库工具, 支持加密
    mysql84 # mysql数据库工具
    duckdb # 嵌入式分析数据库

    # gpu
    glslang
    glslviewer

    #! grpc
    grpcurl
    grpcui

    #! nats
    natscli
    nkeys
    nats-top
    nats-server

    beekeeper-studio # 数据库工具
    dbeaver-bin # 数据库管理工具
    # sqlitebrowser # sqlite browser
    mqttx # MQTT 客户端
    kdePackages.kcachegrind # 性能分析工具
  ];
  programs = {
    mise = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
