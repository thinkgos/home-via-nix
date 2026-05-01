{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
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

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  imports = [
    ./systemd.nix
    ./fonts.nix
    ./password-store.nix
    ./accounts.nix
    ./assets.nix
    ./terminal/terminal.nix
    ./shell/shell.nix
    ./editor/editor.nix
    ./devtools/devtools.nix
    ./programs/programs.nix
    ./fun/fun.nix
    ./scripts/scripts.nix
    ./ai/ai.nix

  ]
  ++ (lib.optionals (customize.desktop != null)) [
    ./desktop/desktop.nix
  ];

  targets.genericLinux = {
    enable = true;
    gpu.enable = true;
  };

  xdg = {
    enable = true;
    mime.enable = true;
    # add to XDG_DATA_DIRS
    systemDirs.data = [
      "/var/lib/flatpak/exports/share"
      "$HOME/.local/share/flatpak/exports/share"
    ];
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      projects = "${config.home.homeDirectory}/Projects";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Templates";
      videos = "${config.home.homeDirectory}/Videos";
      extraConfig = {
        program = "${config.home.homeDirectory}/Programs";
        tmp = "${config.home.homeDirectory}/Tmp";
      };
    };
  };

  nixpkgs.config = {
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "albert"
      ];
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    btop # 图形化进程/系统监控器
    typos # 检查拼写错误
    mdbook # 从markdown文档生成book
    trash-cli # 回收站
    parallel # 并行执行命令

    nixd
    nil
    nixfmt
    nixfmt-tree

    #! desktop 统一管理图形化应用

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello

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
    BAT_PAGER = "less -r";
    TMPDIR = "$HOME/.cache/tmp";
  };

  # Create TMPDIR if it doesn't exist
  home.activation.createTmpDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.cache/tmp"
  '';

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
