{ config, lib, pkgs, customize, ... }:
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

  targets.genericLinux = {
    enable = true;
    gpu.enable = true;
  };

  imports = [
    ./shell
    ./devtools
    ./editor
    ./git.nix
  ] ++ lib.optionals customize.graphics [
    ./graphical
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    #! 基础工具
    tree        # 目录树
    curl        # 网络请求工具
    wget        # 网络下载工具
    tmux        # 终端多路复用工具
    jq          # json美化过滤

    #! 命令行替代工具
    eza         # 替代ls
    ripgrep     # 替代grep
    fd          # 替代find
    dust        # 替代du  
    bat         # 替代cat

    #! 通用工具
    tealdeer    # 快速查找命令, 同tldr
    tokei       # 统计代码行数
    glow        # markdown预览器
    bottom      # 图形化进程/系统监控器
    typos       # 检查拼写错误
    mdbook      # 从markdown文档生成book

    #! home-manager - devtools 统一管理
    #! home-manager - shell 统一管理
    #! home-manager 在programs中统一开启

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
  };
}
