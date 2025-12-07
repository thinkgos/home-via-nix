{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "thinkgo";
  home.homeDirectory = "/home/thinkgo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    #! 基础工具
    zsh         # 终端shell
    tmux        # 终端多路复用工具
    vim         # 终端文本编辑器  
    jq          # json美化过滤

    #! 编译工具链
    mold        # 快速编译链接器
    clang_20    # clang-20

    #! 命令行替代工具
    bat         # 替代cat
    eza         # 替代ls
    ripgrep     # 替代grep
    fd          # 替代find
    dust        # 替代du  
    zoxide      # 替代z, 快速跳转目录

    #! git相关
    gitui       # git ui界面
    delta       # git-delta, git语法高亮分页器
    git-cliff   # 定制生成Changelog
    gfold       # 跟踪git仓库

    #! shell相关
    direnv      # shell扩展用于管理环境变量

    #! 通用工具
    yazi        # 终端文件管理
    zellij      # 终端多路复用工具
    atuin       # 命令历史记录
    starship    # 提示工具
    tealdeer    # 快速查找命令, 同tldr
    tokei       # 统计代码行数
    glow        # markdown预览器
    bottom      # 图形化进程/系统监控器

    #! 编程相关
    sccache     # 缓存编译结果
    mdbook      # 从markdown文档生成book

    #! Rust工具链
    # cargo-cross # 跨平台编译Rust程序

    #! 环境管理
    mise        # 管理开发环境, 软件多版本管理

    #! 编辑器

    #! zsh插件
    # zsh-autosuggestions
    # zsh-syntax-highlighting

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".vimrc".source = dotfiles/.vimrc;
    ".wezterm.lua".source = dotfiles/wezterm.lua;

    ".config/starship.toml".source = dotfiles/starship/gruvbox-rainbow.toml;
    ".config/zellij/config.kdl".source = dotfiles/zellij.kdl;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/thinkgo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    setOptions = [ "no_nomatch" ];
    shellAliases = {
      nv = "nvim";
      tf = "terraform";
      ls = "eza";
      cat = "bat -p";
    };

    initContent =  let 
      zshConfigEarlyInit = lib.mkOrder 500 ''     
      ''; 
      zshConfigLast = lib.mkOrder 1500 ''
        autoload -U +X bashcompinit && bashcompinit

        eval "$(starship init zsh)"
        eval "$(atuin init zsh --disable-up-arrow)"
        eval "$(zoxide init zsh)"
        # eval "$(fnm env --use-on-cd --shell zsh)"
      ''; 
    in 
      lib.mkMerge [ zshConfigEarlyInit zshConfigLast ];

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;  
    oh-my-zsh = {
      enable = true;
      # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
      theme = "agnoster";
      plugins = [
        "zoxide"
        "fzf"
        "git"
        "fig"
        "golang"
        "rust"
        "npm"
        "tmux"
        "vagrant"
        "kubectl"
        "helm"
        "minikube"
        "docker"
        "cp"
        "ansible"
        "fnm"
      ];
    };
  };
}
