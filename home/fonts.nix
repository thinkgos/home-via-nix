{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # core fonts
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    # adwaita-fonts
    adwaita-fonts
    adwaita-icon-theme
    # nerd-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.meslo-lg

    font-awesome
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "JetBrainsMono Nerd Font Mono"
        "FiraCode Nerd Font Mono"
        "MesloLGL Nerd Font Mono"
        "Hack Nerd Font"
        "MesloLGS NF"
        "Noto Sans Mono CJK SC"
      ];
      sansSerif = [
        "Inter"
        "Adwaita Sans"
        "Noto Sans CJK SC"
      ];
      serif = [
        "Adwaita Sans"
        "Noto Serif CJK SC"
      ];
    };
  };
}
