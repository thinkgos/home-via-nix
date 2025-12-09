{ config, lib, pkgs, ... }: 
{
  # Home Manager is pretty good at managing dotfiles. 
  # The primary way to manage plain files is through 'home.file'.
  home.file = {
    ".wezterm.lua".source = ./assets/wezterm.lua;
  };
}