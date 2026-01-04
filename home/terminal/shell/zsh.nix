{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    # 附加自定义函数
    ".config/zsh/functions.zsh".source = ./functions.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = ''
      # rustup
      export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
      export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup

      # rust
      # rustup shell setup
      # affix colons on either side of $PATH to simplify matching
      case ":$PATH:" in
          *:"$HOME/.cargo/bin":*)
              ;;
          *)
              # Prepending path in case a system-installed rustc needs to be overridden
              export PATH="$HOME/.cargo/bin:$PATH"
              ;;
      esac

      # go
      export GOPATH=~/go
      if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
          export PATH=$PATH:$GOPATH/bin
      fi
    '';

    setOptions = [ "no_nomatch" ];
    shellAliases = {
      # see home.shellAliases for the top level attribute names
      # here specific to zsh
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

          if [ -f "$HOME/.config/zsh/functions.zsh" ]; then
            source "$HOME/.config/zsh/functions.zsh"
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
}
