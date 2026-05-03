{
  config,
  lib,
  pkgs,
  customize,
  extra-pkgs,
  ...
}:
{
  programs.niri = {
    package = extra-pkgs.niri;
    enable = true;
    settings = {

    };
    config = "";
  };
}
