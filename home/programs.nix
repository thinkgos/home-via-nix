{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    #! 基础工具
    tree # 目录树
    nmap # 网络扫描工具
    netcat-openbsd # nc 网络工具
    curl # 网络请求工具
    wget # 网络下载工具
    tmux # 终端多路复用工具
    jq # json美化过滤
    jaq # json美化过滤
    yq # yaml美化过滤
    fastfetch # 系统信息查看工具

    #! 命令行替代工具
    eza # 替代ls
    ripgrep # 替代grep
    fd # 替代find
    dust # 替代du
    bat # 替代cat

    #! 通用工具
    tokei # 统计代码行数
    glow # markdown预览器
    bottom # 图形化进程/系统监控器
    typos # 检查拼写错误
    mdbook # 从markdown文档生成book
    aria2 # 高速下载工具
    trash-cli # 回收站
    parallel # 并行执行命令
  ];

  programs = {
    # 快速查找命令, 同tldr
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.tealdeer.enable
    tealdeer = {
      enable = true;
      enableAutoUpdates = true;
      # https://tealdeer-rs.github.io/tealdeer/config.html
      settings = {
        updates = {
          auto_update = true;
          auto_update_interval_hours = 72;
        };
      };
    };
  };
}
