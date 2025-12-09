{config, lib, pkgs, ...}: 
{
  programs.zsh = {
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
}