{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  home.packages = [ pkgs.piri ];
}
