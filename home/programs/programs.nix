{
  config,
  lib,
  pkgs,
  ...
}:
{
  # imports = [ ];

  home.packages = with pkgs; [
    #! 基础工具
    tree # 目录树
    nmap # 网络扫描工具
    netcat-openbsd # nc 网络工具
    curl # 网络请求工具
    wget # 网络下载工具
    tmux # 终端多路复用工具
    jq # json美化过滤
    yq # yaml美化过滤
    fastfetch # 系统信息查看工具
    chezmoi # 管理dotfiles

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
    trash-cli # 回收站
    parallel # 并行执行命令
  ];
}
