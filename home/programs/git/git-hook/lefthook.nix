{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    lefthook # git hook manager
  ];
  xdg.configFile."lefthook.json".text = builtins.toJSON {
    no_auto_install = false;
  };
}
