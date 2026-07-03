{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./system.nix
    ./nix.nix
    ./zellij/zellij.nix
    ./starship/starship.nix
    ./git.nix
    ./github.nix
    ./ansible.nix
    ./tldr.nix
  ];

  home.sessionVariables = {
    BAT_PAGER = "less -r";
  };

  home.packages = with pkgs; [
    resvg # svg rendering
    poppler # pdf rendering
    _7zz # 7-zip archiver utility
    ueberzugpp # hack image for terminal emulators
    go-task # 任务管理器
    aria2 # 高速下载工具
    tesseract # ocr工具
    wttrbar # 天气栏

    ohshell # ohshell
  ];

  programs = {
    carapace = {
      enable = false;
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
      defaultCommand = "fd --hidden";
      changeDirWidget = {
        command = "fd --hidden";
        options = [
          "--walker-skip .git,node_modules,target"
          "--preview 'tree -C -L 3 {}'"
        ];
      };
      historyWidget = {
        command = "";
        options = [ ];
      };
    };

    skim = {
      enable = true;
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
