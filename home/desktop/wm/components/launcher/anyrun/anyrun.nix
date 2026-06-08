{
  config,
  lib,
  pkgs,
  ...
}:
{
  # anyrun 应用启动器
  # https://github.com/anyrun-org/anyrun

  programs.anyrun = {
    enable = true;
    config = {
      x = {
        fraction = 0.5;
      };
      y = {
        fraction = 0.1;
      };
      width = {
        absolute = 680;
      };
      height = {
        absolute = 1;
      };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libactions.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
        "${pkgs.anyrun}/lib/libsymbols.so"
        "${pkgs.anyrun}/lib/libwebsearch.so"
        "${pkgs.anyrun}/lib/libtranslate.so"
        "${pkgs.anyrun-plugins}/lib/libssh_pattern.so"
        "${pkgs.anyrun-plugins}/lib/libmenu_bar.so"
      ];
    };

    extraCss = builtins.readFile ./config/style.css;
    extraConfigFiles = {
      "applications.ron".source = ./config/applications.ron;
      "actions.ron".source = ./config/actions.ron;
      "rink.ron".source = ./config/rink.ron;
      "shell.ron".source = ./config/shell.ron;
      "symbols.ron".source = ./config/symbols.ron;
      "websearch.ron".source = ./config/websearch.ron;
      "translate.ron".source = ./config/translate.ron;
      "ssh-pattern.ron".source = ./config/ssh-pattern.ron;
      "menu-bar.ron".source = ./config/menu-bar.ron;
    };
  };
}
