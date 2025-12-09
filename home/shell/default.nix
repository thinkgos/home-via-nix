{config, lib, pkgs, ...}:
let 
  fromTomlFile = filename: builtins.fromTOML (builtins.readFile filename);
  # 配置文件路径
  configPath = {
    starship = ./assets/starship/gruvbox-rainbow.toml;
    zellij = ./assets/zellij.kdl;
  };
in {
  imports = [ 
    ./zsh.nix 
  ];

  home.packages = with pkgs;[
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
 ];

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = fromTomlFile configPath.starship;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = false;
      mise.enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [ "--disable-up-arrow" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    zellij = {
      enable = true;
      extraConfig = builtins.readFile configPath.zellij;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      extraPackages = with pkgs;[ glow ];
    };
  };
}