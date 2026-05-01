{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zellij/zellij.nix
    ./starship/starship.nix
    ./git.nix
    ./github.nix
    ./ansible.nix
    ./tldr.nix
    ./yt-dlp.nix
  ];
  home.packages = with pkgs; [
    resvg # svg rendering
    poppler # pdf rendering
    _7zz # 7-zip archiver utility
    imagemagick # image suite
    ueberzugpp # hack image for terminal emulators

    # zsh                     # zsh
    # zsh-autosuggestions     # zsh命令自动建议
    # zsh-syntax-highlighting # zsh语法高亮
    # starship                # 提示工具
    # direnv                  # shell扩展用于管理环境变量
    # zoxide                  # 替代z, 快速跳转目录
    # atuin                   # 命令历史记录
    # fzf                     # 模糊查找工具
    # zellij                  # 终端多路复用工具
    # yazi                    # 终端文件管理
    go-task # 任务管理器
    aria2 # 高速下载工具
  ];

  programs = {
    carapace = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      silent = false;
      mise.enable = true;
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      flags = [ "--disable-up-arrow" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      changeDirWidgetOptions = [
        "--walker-skip .git,node_modules,target"
        "--preview 'tree -C -L 3 {}'"
      ];
      defaultCommand = "fd --hidden";
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      shellWrapperName = "y";
      extraPackages = with pkgs; [ glow ];
    };
  };
}
