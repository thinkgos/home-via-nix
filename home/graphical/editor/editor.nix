{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zed.nix
  ];

  home.packages = with pkgs; [
    # zed           # 代码编辑器
  ];
}
