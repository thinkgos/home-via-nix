{
  config,
  lib,
  pkgs,
  ...
}:
let
  fromTomlFile = filename: builtins.fromTOML (builtins.readFile filename);
  # 配置文件路径
  configPath = {
    starship = ./assets/starship/gruvbox-rainbow.toml;
    zellij = ./assets/zellij.kdl;
  };
in
{
  imports = [
    ./zsh.nix
    # ./bash.nix
  ];

  home.packages = with pkgs; [
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

  home.shellAliases = {
    # the top level attribute names.
    # If you need to use a shell specific feature
    # then make sure to use a shell specific option
    ls = "eza";
    cat = "bat -p";
    mv = "mv -i";
    cp = "cp -i";
    rm = "trash -v";
    mkdir = "mkdir -p";
    nv = "nvim";
    tf = "terraform";
    jq = "jaq";
    fb = "fzf --preview 'bat --color=always {-1}'";
    fbv = "fzf --preview 'bat --color=always {}' --bind 'enter:become(vim {-1})' --bind 'ctrl-o:execute:vim {-1}'";
    frv = "(RELOAD='reload:rg --column --color=always --smart-case {q} || :' && fzf --disabled --ansi --bind \"start:$RELOAD\" --bind \"change:$RELOAD\" --bind 'enter:become:vim {1} +{2}' --bind 'ctrl-o:execute:vim {1} +{2}' --delimiter : --preview 'bat --style=full --color=always --highlight-line {2} {1}' --preview-window '~4,+{2}+4/3,<80(up)')";
  };

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = fromTomlFile configPath.starship;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      silent = false;
      mise.enable = true;
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      flags = [ "--disable-up-arrow" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      changeDirWidgetOptions = [
        "--walker-skip .git,node_modules,target"
        "--preview 'tree -C -L 3 {}'"
      ];
    };

    zellij = {
      enable = true;
      extraConfig = builtins.readFile configPath.zellij;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      extraPackages = with pkgs; [ glow ];
    };
  };
}
