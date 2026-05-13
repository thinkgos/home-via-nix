{
  config,
  lib,
  pkgs,
  ...
}:
{
  log4sh = pkgs.writeTextFile {
    name = "log4sh";
    destination = "/lib/shell/log4sh.sh";
    text = (builtins.readFile ./log4sh.sh);
  };
}
