{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs;[
    git-cliff   # 定制生成Changelog
    gfold       # 跟踪git仓库
    pre-commit  # git pre-commit hook
  ];
  
  # Home Manager is pretty good at managing dotfiles. 
  # The primary way to manage plain files is through 'home.file'.
  home.file = {
    ".config/git/.gitmessage".text = ''

      # head: <type>(<scope>): <subject>
      # - type: feat, fix, doc, perf, style, refactor, test, chore, security, revert
      # - scope: can be empty (eg. if the change is a global or difficult to assign to a single component)
      # - subject: start with verb (such as 'change'), 50-character line

      # body: 72-character wrapped.
      # This should answer:              
      # * Why was this change necessary?
      # * How does it address the problem?
      # * Are there any side effects?

      # footer:
      # - Include a link to the ticket, if any.
      # - BREAKING CHANGE
    '';
  };

  programs ={
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
          editor = "vim";
        };
        add.interactive.useBuiltin = false;
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
        credential.helper = "store";
        commit.template = "~/.config/git/.gitmessage";
      };
    };

    gitui = {
      enable = true;
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
      enableJujutsuIntegration = true;
      options = {
        navigate = true;    
        light = false;      
        side-by-side = true;
      };
    };

    jujutsu = {
      enable = true;
      ediff = config.programs.vim.enable;
      settings = {

      };
    };

    jjui = {
      enable = true;
      settings = {

      };
    };
  };
}