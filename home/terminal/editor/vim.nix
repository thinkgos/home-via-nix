{ config, lib, pkgs, ... }: 
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      syntax on           " 开启语法高亮

      set enc=utf-8       " 设置编码为utf-8
      set autoindent      " 自动缩进
      set tabstop=4       " 制表符宽度
      set expandtab       " 制表符转换为空格
      set shiftwidth=4    " 缩进宽度4个空格
      set number          " 显示绝对行号
      set relativenumber  " 显示相对行号
      set ruler           " 状态栏显示光标所在行号和列号
      set wrap            " 自动折行
      set hlsearch        " 高亮搜索结果
      set incsearch       " 增量搜索
      set showmatch       " 显示匹配括号
      set wildmenu        " 增强命令补全
      set showcmd         " 显示命令    

      set clipboard=unnamedplus " 复制到系统剪贴板

      noremap <Up> <NOP>
      noremap <Down> <NOP>
      noremap <Left> <NOP>
      noremap <Right> <NOP>
    '';
    plugins = [];
  };
}