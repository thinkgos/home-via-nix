{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  programs.niri = {
    package = pkgs.niri;
    enable = true;
    settings = {

    };
    config = "";
  };
}
