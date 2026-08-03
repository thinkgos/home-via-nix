{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      package = customize.theme.package;
      name = customize.theme.name;
    };
    cursorTheme = {
      package = customize.cursor.package;
      name = customize.cursor.name;
      size = 24;
    };
    iconTheme = {
      package = customize.icon.package;
      name = customize.icon.name;
    };
    font = {
      package = pkgs.inter;
      name = "Inter";
      size = 11;
    };
    gtk4 = {
      enable = true;
      theme = null;
    };
  };
}
