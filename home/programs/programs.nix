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
  ];
  home.packages = with pkgs; [
    resvg # svg rendering
    poppler # pdf rendering
    _7zz # 7-zip archiver utility
    imagemagick # image suite
    ueberzugpp # hack image for terminal emulators
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
