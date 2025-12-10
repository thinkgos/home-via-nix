{ config, lib, pkgs, ... }: 
{
  imports = [
    ./vscode.nix
  ];

  home.packages = with pkgs;[
    # vscode # 代码编辑器
  ];
}