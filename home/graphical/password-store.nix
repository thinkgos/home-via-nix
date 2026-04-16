{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    password-store = {
      enable = true;
      settings = {

      };
    };
    browserpass = {
      enable = true;
      browsers = [
        "chrome"
        "firefox"
      ];
    };
  };
}
