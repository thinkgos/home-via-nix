{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    wl-clipboard
  ];
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
