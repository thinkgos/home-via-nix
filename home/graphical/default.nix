{ config, lib, pkgs, ... }: 
{
  imports = [
    ./shell
    ./editor
    ./devtools
    ./usual
  ];

  xdg = {
    enable = true;
    mime.enable = true;
  };

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "redisinsight"
      "vscode"
    ];
  };

  home.packages = with pkgs;[];
}