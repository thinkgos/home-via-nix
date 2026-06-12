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

    font-awesome
  ];
  fonts.fontconfig = {
    enable = true;
    hinting = "slight";
    subpixelRendering = "rgb";
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "JetBrainsMono Nerd Font Mono"
        "FiraCode Nerd Font Mono"
        "Hack Nerd Font"
        "Noto Sans Mono CJK SC"
      ];
      sansSerif = [
        "Inter"
        "Adwaita Sans"
        "Noto Sans CJK SC"
      ];
      serif = [
        "Noto Serif"
        "Noto Serif CJK SC"
      ];
    };
    configFile = {
      "jetbrains-mono-nerd-font-mono" = {
        enable = true;
        label = "jetbrains-mono-nerd-font-mono";
        priority = 90;
        source = ./jetbrains-mono-nerd-font-mono.conf;
      };
    };
  };
}
