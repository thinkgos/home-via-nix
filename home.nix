{ config, lib, pkgs, customize, ... }:
let 
  fromTomlFile = filename: builtins.fromTOML (builtins.readFile filename);
  onGui = cfg: lib.mkIf (customize.onGui) cfg;
  # 配置文件路径
  configPath = {
    starship = dotfiles/starship/gruvbox-rainbow.toml;
    zellij = dotfiles/zellij.kdl;
    wezterm = dotfiles/wezterm.lua;
  };
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = customize.username;
  home.homeDirectory = "/home/${customize.username}";

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
    tree        # 目录树
    curl        # 网络请求工具
    wget        # 网络下载工具
    tmux        # 终端多路复用工具
    jq          # json美化过滤

    #! 编译库及工具链
    autoconf    # 自动配置工具
    gnumake     # 构建工具
    cmake       # 跨平台构建工具
    mold        # 快速编译链接器
    gcc         # gcc
    libgcc      # 运行时库

    #! 命令行替代工具
    eza         # 替代ls
    ripgrep     # 替代grep
    fd          # 替代find
    dust        # 替代du  
    bat         # 替代cat

    #! git相关
    gitui       # git ui界面
    delta       # git-delta, git语法高亮分页器
    git-cliff   # 定制生成Changelog
    gfold       # 跟踪git仓库

    #! 通用工具
    tealdeer    # 快速查找命令, 同tldr
    tokei       # 统计代码行数
    glow        # markdown预览器
    bottom      # 图形化进程/系统监控器
    typos       # 检查拼写错误

    #! 编程相关
    sccache     # 缓存编译结果
    mdbook      # 从markdown文档生成book
    pre-commit  # git pre-commit hook
    upx         # 二进制压缩工具

    #! 数据库工具
    sqlite          # sqlite数据库工具
    sqlcipher       # sqlite数据库工具, 支持加密
    libmysqlclient  # mysql数据库工具
    mycli           # mysql客户端

    #! Rust工具链
    cargo-deny          # 检查依赖项
    cargo-udeps         # 检查未使用的依赖
    cargo-shear         # 检测和删除未使用的依赖
    cargo-audit         # 检查依赖项安全
    cargo-tarpaulin     # 测试覆盖率工具
    cargo-expand        # 宏展开
    cargo-nextest       # 并行测试运行器

    cargo-cross         # 跨平台编译Rust程序
    cargo-update        # 检查更新已安装可执行文件
    cargo-zigbuild      # 跨平台编译Rust程序, 使用zig作为后端
    cargo-generate      # 从模板生成Rust项目
    cargo-bloat         # 检查二进制文件中的大依赖项
    cargo-binutils      # llvm二进制工具
    cargo-semver-checks # 检查crate是否符合语义版本规范
    tokio-console       # tokio任务调试工具

    #! 环境管理

    #! 编辑器

    #! home-manager 在programs中统一开启
    # vim                     # 文本编辑器
    # zsh                     # zsh
    # zsh-autosuggestions     # zsh命令自动建议
    # zsh-syntax-highlighting # zsh语法高亮
    # starship                # 提示工具
    # direnv                  # shell扩展用于管理环境变量
    # mise                    # 管理开发环境, 软件多版本管理
    # zellij                  # 终端多路复用工具
    # zoxide                  # 替代z, 快速跳转目录
    # atuin                   # 命令历史记录
    # yazi                    # 终端文件管理
    # fzf                     # 模糊查找工具
    
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello

    #! fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    nerd-fonts.fira-code
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
    ".wezterm.lua".source = dotfiles/wezterm.lua;
    ".config/git/.gitmessage".source = dotfiles/.gitmessage;
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
  #  /etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.activation.ensureFonts = lib.hm.dag.entryAfter [ "copyFonts" ] ''
    echo "!! Symlink fonts"

    srcFontDir=${config.home.homeDirectory}/.nix-profile/share/fonts/truetype/NerdFonts;
    dstFontDir=${config.home.homeDirectory}/.local/share/fonts;

    mkdir -p $dstFontDir
    ln -sfn $srcFontDir/JetBrainsMono $dstFontDir/JetBrainsMono
    ln -sfn $srcFontDir/FiraCode $dstFontDir/FiraCode
    ln -sfn $srcFontDir/MesloLG $dstFontDir/MesloLG
    ln -sfn $srcFontDir/Hack $dstFontDir/Hack
  '';

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    zsh = {
      enable = true;
      envExtra = ''    
        # rustup
        export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
        export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup

        # rust
        . "$HOME/.cargo/env"

        # go
        export GOPATH=~/go
        if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
            export PATH=$PATH:$GOPATH/bin
        fi
      '';
      
      setOptions = [ "no_nomatch" ];
      shellAliases = {
        nv = "nvim";
        tf = "terraform";
        ls = "eza";
        cat = "bat -p";
      };
      initContent =  
        let 
          zshConfigEarlyInit = lib.mkOrder 500 
            '' 
              fpath=(~/.zfunc $fpath) # 增加zsh代码补全脚本路径
            ''; 
          zshConfigLast = lib.mkOrder 1500 
            ''
              autoload -U +X bashcompinit && bashcompinit
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
        ];
      };
    };

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

    mise = {
      enable = true;
      enableZshIntegration = true;
    };

    vim = {
      enable = true;
      extraConfig = ''
        syntax on

        set autoindent
        set tabstop=4
        set expandtab
        set shiftwidth=4
        set number
        set relativenumber
        set ruler
        set hlsearch
        set incsearch
        set showmatch
        set wrap
        set wildmenu
        set showcmd

        set enc=utf-8

        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>
      '';
      plugins = [];
    };

    zellij = {
      enable = true;
      extraConfig = builtins.readFile configPath.zellij;
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

    yazi = {
      enable = true;
      enableZshIntegration = true;
      extraPackages = with pkgs;[ glow ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "thinkgo";
          email = "thinkgo@aliyun.com";
        };
        core = {
          # autocrlf
          # windows和linux换行符差异, 需要配置换行符, windows 是CRLF, linux/mac是LF
          # 保存仓库永远为LF, 在Windows工作空间都是CRLF, 在Mac/Linux工作空间都是LF.
          # 在windows配置`autocrlf = true`, 提交时自动CRLF转LF, 检出时自动将LF转CRLF
          # linux/mac配置`autocrlf = input`, 提交时自动CRLF转LF, 检出时自动将保持LF.
          autocrlf = "input";
          safecrlf = "warn"; # 提交包含混合换行符的文件时给出警告
          pager = "delta";
          editor = "vim";
        };
        interactive.diffFilter = "delta --color-only";
        add.interactive.useBuiltin = false;
        delta = {
          navigate = true;    
          light = false;      
          side-by-side = true;
        };
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
        credential.helper = "store";
        commit.template = "~/.config/git/.gitmessage";
      };
    };
  };
}
