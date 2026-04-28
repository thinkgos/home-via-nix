{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.password-store = {
    enable = true;
    settings = {

    };
  };
}
