{ config, lib, pkgs, ... }: 
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      syntax on

      set autoindent
      set tabstop=4
      set expandtab
      set shiftwidth=4
      set number
      set relativenumber
      set ruler
      set hlsearch
      set incsearch
      set showmatch
      set wrap
      set wildmenu
      set showcmd

      set enc=utf-8

      noremap <Up> <NOP>
      noremap <Down> <NOP>
      noremap <Left> <NOP>
      noremap <Right> <NOP>
    '';
    plugins = [];
  };
}