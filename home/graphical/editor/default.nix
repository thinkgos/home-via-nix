{ config, lib, pkgs, ... }: 
{
  imports = [
    ./vscode.nix
    ./zed.nix
  ];

  home.packages = with pkgs;[
    # vscode        # 代码编辑器
    # zed           # 代码编辑器
  ];
}