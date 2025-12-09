{ config, lib, pkgs, ... }:
let 
  # 配置文件路径
  configPath = {
    gitMessageDst = ".config/git/.gitmessage";
    gitMessageSrc = ./assets/.gitmessage;
  };
in
{
  home.packages = with pkgs;[
    gitui       # git ui界面
    delta       # git-delta, git语法高亮分页器
    git-cliff   # 定制生成Changelog
    gfold       # 跟踪git仓库
  ];
  
  # Home Manager is pretty good at managing dotfiles. 
  # The primary way to manage plain files is through 'home.file'.
  home.file = {
    "${configPath.gitMessageDst}".source = configPath.gitMessageSrc;
  };

  programs.git = {
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
        pager = "delta";
        editor = "vim";
      };
      interactive.diffFilter = "delta --color-only";
      add.interactive.useBuiltin = false;
      delta = {
        navigate = true;    
        light = false;      
        side-by-side = true;
      };
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      credential.helper = "store";
      commit.template = "~/.config/git/.gitmessage";
    };
  };
}