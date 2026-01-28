{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    "${config.xdg.configHome}/zsh/env-extra/env-cargo".source = ./sh/env-cargo;
    "${config.xdg.configHome}/zsh/env-extra/env-go".source = ./sh/env-go;
  };

  # https://github.com/ohmyzsh/ohmyzsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = "${config.xdg.configHome}/zsh";
    envExtra = ''
      # env
      export PATH=$HOME/.opencode/bin:$PATH
      # develop tools
      source "${config.xdg.configHome}/zsh/env-extra/env-go"
      source "${config.xdg.configHome}/zsh/env-extra/env-cargo"
    '';

    setOptions = [ "no_nomatch" ];
    shellAliases = {
      # see home.shellAliases for the top level attribute names
      # here specific to zsh
      mkdir = "mkdir -p";
      ls = "eza";
      mv = "mv -i";
      cp = "cp -i";
      rm = "trash -v";
    };
    initContent =
      let
        zshConfigEarlyInit = lib.mkOrder 500 "";
        zshConfigLast = lib.mkOrder 1500 ''
          autoload -U +X bashcompinit && bashcompinit
          if [[ "$TERM" == "xterm-kitty" ]] && ! infocmp "$TERM" >/dev/null 2>&1; then 
            export TERM=xterm-256color 
          fi
        '';
      in
      lib.mkMerge [
        zshConfigEarlyInit
        zshConfigLast
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
    siteFunctions = {
      # 指定路径进行fzf搜索
      # ff [path]
      ff = "fd . $1 | fzf";
      # 指定路径进行fzf搜索, 并bat进行预览文件内容
      # fb [path]
      fb = ''fd . --type file $1 | fzf --preview "bat --style=plain --color=always {-1}"'';
      # 指定路径进行fzf搜索, 并bat进行预览文件内容, 选中回车进行vim编辑或ctrl+o开新窗口进行vim编辑
      # fbv [path]
      fbv = ''fd . --type file $1 | fzf --preview "bat --style=plain --color=always {}" --bind "enter:become(vim {-1})" --bind "ctrl-o:execute:vim {-1}"'';
      # 指定路径使用fzf提供交互窗口进行rg搜索, 并bat进行预览文件内容, 选中回车进行vim编辑或ctrl+o开新窗口进行vim编辑
      # frv [path]
      frv = ''
        local target_dir=$1
        local RELOAD="reload:rg --column --color=always --smart-case {q} $target_dir || :"
        fzf \
          --disabled \
          --ansi \
          --bind "start:$RELOAD" \
          --bind "change:$RELOAD" \
          --bind "enter:become:vim {1} +{2}" \
          --bind "ctrl-o:execute:vim {1} +{2}" \
          --delimiter : \
          --preview "bat --style=plain --color=always --highlight-line {2} {1}" \
          --preview-window "~4,+{2}+4/3,<80(up)"
      '';
      # 递归子模块 执行命令
      gitsub-command = ''
        local command=$1
        if [[ -z $command ]]; then
          echo "请指定命令"
          return 1
        fi
        git submodule foreach --recursive "$command"
      '';
      # 递归子模块 git pull rebase
      gitsub-pull-rebase = ''gitsub-command "git pull --rebase"'';
      # 递归子模块 git checkout ${branch}
      gitsub-switch-branch = ''
        	local branch=$1
        	if [[ -z $branch ]]; then
        		echo "请指定分支"
        		return 1
        	fi
        	gitsub-command "git checkout ''${branch}"
      '';
      # 递归子模块 git checkout -b ${branch} origin/${branch}
      gitsub-checkout-branch = ''
        	local branch=$1
        	if [[ -z $branch ]]; then
        		echo "请指定分支"
        		return 1
        	fi
        	gitsub-command "git checkout -b ''${branch} origin/''${branch}"
      '';
      # 递归子模块 git fetch origin ${branch}:${branch}
      gitsub-fetch-origin = ''
        	local branch=$1
        	if [[ -z $branch ]]; then
        		echo "请指定分支"
        		return 1
        	fi
        	gitsub-command "git fetch origin ''${branch}:''${branch}"
      '';
      # 递归子模块 执行命令
      gitsub-command-cc = ''
        	local command=$1
        	if [[ -z $command ]]; then
        		echo "请指定命令"
        		return 1
        	fi
        	git submodule foreach --quiet --recursive 'echo $path' | parallel -j 8 "cd {} && echo '进入 {}' && $command"
      '';
      # 递归子模块 git pull rebase
      gitsub-pull-rebase-cc = ''gitsub-command-cc "git pull --rebase"'';
      # 递归子模块 git checkout ${branch}
      gitsub-switch-branch-cc = ''
        	local branch=$1
        	if [[ -z $branch ]]; then
        		echo "请指定分支"
        		return 1
        	fi
        	gitsub-command-cc "git checkout ''${branch}"
      '';
      # 递归子模块 git checkout -b ${branch} origin/${branch}
      gitsub-checkout-branch-cc = ''
        	local branch=$1
        	if [[ -z $branch ]]; then
        		echo "请指定分支"
        		return 1
        	fi
        	gitsub-command-cc "git checkout -b ''${branch} origin/''${branch}"
      '';
      # 递归子模块 git fetch origin ${branch}:${branch}
      gitsub-fetch-origin-cc = ''
        	local branch=$1
        	if [[ -z $branch ]]; then
        		echo "请指定分支"
        		return 1
        	fi
        	gitsub-command-cc "git fetch origin ''${branch}:''${branch}"
      '';
    };

    autocd = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
      theme = "agnoster";
      plugins = [
        "git" # git client
        "cp"
        "tmux"
        "extract"
      ];
    };
  };
}
