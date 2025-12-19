{ config, lib, pkgs, ... }: 
{
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    # settings = {

    # };
    # themes = {

    # };
  };
}