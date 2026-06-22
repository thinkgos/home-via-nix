{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = "${config.xdg.configHome}/zsh";
    envExtra = ''
      # develop tools
      ${builtins.readFile ./env-develop/go}
      ${builtins.readFile ./env-develop/cargo}
      ${builtins.readFile ./env-develop/goup}
      source "${config.xdg.configHome}/zsh/.zshrc-credentials"
    '';

    setOptions = [ "no_nomatch" ];
    shellAliases = {
      # see home.shellAliases for the top level attribute names
      # here specific to zsh
      mkdir = "mkdir -p";
      ls = "eza";
      cls = "clear";
      mv = "mv -i";
      cp = "cp -i";
      rm-trash = "trash -v";
    };
    initContent = lib.mkMerge [
      # (lib.mkOrder 100 "zmodload zsh/zprof") # 测试
      # (lib.mkOrder 500 "")
      # (lib.mkOrder 550 "zstyle ':completion:*' check-path false")
      (lib.mkOrder 1500 ''
        autoload -U +X bashcompinit && bashcompinit
        if [[ "$TERM" == "xterm-kitty" ]] && ! infocmp "$TERM" >/dev/null 2>&1; then
        export TERM=xterm-256color
        fi
        if [[ "$TERM" == "xterm-ghostty" ]] && ! infocmp "$TERM" >/dev/null 2>&1; then
        export TERM=xterm-256color
        fi
      '')
      # (lib.mkOrder 2000 "zprof") # 测试
    ];
    history = {
      ignorePatterns = [
        "exit"
        "clear"
        "history"
        "ls"
        "rm *"
        "pkill *"
      ];
    };
    siteFunctions = { };
    syntaxHighlighting = {
      enable = false; # 禁用语法高亮, 使用fast-syntax-highlighting
      package = pkgs.zsh-syntax-highlighting;
    };
    autosuggestion.enable = true;
    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting";
      }
    ];
    autocd = true;
    # https://github.com/ohmyzsh/ohmyzsh/wiki
    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
        "git" # git client
        "cp"
        "extract"
      ];
    };
  };
  # 创建环境变量配置文件，如果不存在
  home.activation.create-zshrc-credentials = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    file=${config.xdg.configHome}/zsh/.zshrc-credentials
    if [ ! -f "$file" ]; then
      mkdir -p "$(dirname "$file")"
      cat <<'EOF' > "$file"
    ${builtins.readFile ./env-develop/template-credentials}
    EOF
    fi
  '';
}
