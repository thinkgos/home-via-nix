{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./piri/piri.nix # 扩展配置
  ];
}
