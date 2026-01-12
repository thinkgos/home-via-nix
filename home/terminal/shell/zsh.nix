{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    ".config/zsh/env-cargo".source = ./sh/env-cargo;
    ".config/zsh/env-go".source = ./sh/env-go;
    # 附加自定义函数
    ".config/zsh/functions.sh".source = ./sh/functions.sh;
  };

  # https://github.com/ohmyzsh/ohmyzsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = ''
      # go
      if [ -f "$HOME/.config/zsh/env-go" ]; then
        source "$HOME/.config/zsh/env-go"
      fi

      # rust
      if [ -f "$HOME/.config/zsh/env-cargo" ]; then
        source "$HOME/.config/zsh/env-cargo"
      fi
    '';

    setOptions = [ "no_nomatch" ];
    shellAliases = {
      # see home.shellAliases for the top level attribute names
      # here specific to zsh
      mkdir = "mkdir -p";
    };
    initContent =
      let
        zshConfigEarlyInit = lib.mkOrder 500 ''
          fpath=(~/.zfunc $fpath) # 增加zsh代码补全脚本路径
        '';
        zshConfigLast = lib.mkOrder 1500 ''
          autoload -U +X bashcompinit && bashcompinit
          if [[ "$TERM" == "xterm-kitty" ]] && ! infocmp "$TERM" >/dev/null 2>&1; then 
            export TERM=xterm-256color 
          fi

          if [ -f "$HOME/.config/zsh/functions.sh" ]; then
            source "$HOME/.config/zsh/functions.sh"
          fi
        '';
      in
      lib.mkMerge [
        zshConfigEarlyInit
        zshConfigLast
      ];

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
      theme = "agnoster";
      plugins = [
        "zoxide" # zoxide: smarter cd command
        "fzf" # fzf fuzzy finder
        "git" # git client
        "pass" # password-store
        "gh" # github cli
        "cp"
        "tmux"
        "vagrant"
        "kubectl"
        "helm"
        "minikube"
        "docker"
        "podman"
        "ansible"
        "golang"
        "rust"
        "npm"
      ];
    };
  };
}
