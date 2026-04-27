{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    rtk # harness proxy
  ];
}
