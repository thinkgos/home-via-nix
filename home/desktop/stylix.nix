{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Stylix 统一接管所有应用的主题,字体等
  # https://nix-community.github.io/stylix/index.html
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    enableReleaseChecks = false;
    # https://github.com/tinted-theming/schemes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # see ../fonts.nix
    fonts = {
      # packages = [ ];
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
    };
    icons = {
      enable = false;
      package = customize.icon.package;
      dark = customize.icon.name;
      light = customize.icon.name;
    };
    # see ./pointer-cursor.nix
    cursor = null;
    # 透明度
    opacity = {
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
      terminal = 1.0;
    };
    image = null;
    imageScalingMode = "fit";
    targets = {

    };
  };
}
