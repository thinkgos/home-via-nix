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
    plugins = with pkgs; [
      nushellPlugins.polars # Polars plugin for Nushell
      nushellPlugins.gstat # Git status plugin for Nushell
      nushellPlugins.formats # Formats plugin for Nushell
      nushellPlugins.query # Nushell plugin to query JSON, XML, and various web data
      # nushellPlugins.highlight # Syntax highlighting for Nushell
      # nushellPlugins.semver # Semantic versioning plugin for Nushell
      # nushellPlugins.skim # Fuzzy finder for Nushell
    ];
  };
}
