{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.autostart = {
    enable = true;
    readOnly = false;
    entries = [ ];
  };
}
