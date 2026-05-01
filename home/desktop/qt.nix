{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  qt = {
    enable = true;
    platformTheme = {
      package = [
        pkgs.qadwaitadecorations
        pkgs.qadwaitadecorations-qt6
        pkgs.adwaita-qt
        pkgs.adwaita-qt6
      ];
      name = "adwaita";
    };
    style = {
      package = [
        pkgs.adwaita-qt
        pkgs.adwaita-qt6
      ];
      name = "adwaita-dark";
    };
  };
}
