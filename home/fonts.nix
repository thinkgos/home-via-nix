{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs;[
    adwaita-fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    nerd-fonts.fira-code
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ 
        "JetBrainsMono Nerd Font" 
        "MesloLGL Nerd Font Mono" 
        "Hack Nerd Font" 
        "MesloLGS NF" 
        "FiraCode Nerd Font"
        "Noto Sans Mono CJK SC"
      ];
      sansSerif = [ "Adwaita Sans" "Noto Serif CJK SC" ];
      serif = [ "Adwaita Sans" "Noto Serif CJK SC" ];
    };
  };
}