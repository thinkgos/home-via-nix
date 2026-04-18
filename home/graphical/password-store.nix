{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.browserpass = {
    enable = true;
    browsers = [
      "chrome"
      "firefox"
    ];
  };
}
