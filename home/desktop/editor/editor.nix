{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zed/zed.nix
  ];
  home.packages = with pkgs; [
    sublime4 # 文本编辑器
  ];
}
