{ config, lib, pkgs, ... }: 
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "markdown-oxide"
    ];
  };
}