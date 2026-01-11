{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.nushell = {
    enable = true;
    shellAliases = {

    };
    configFile.source = ./nushell/config.nu;
    envFile.source = ./nushell/env.nu;
    plugins = [

    ];
  };
}
