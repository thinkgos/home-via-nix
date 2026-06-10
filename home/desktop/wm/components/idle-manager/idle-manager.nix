{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 空闲管理
  imports = [
    ./swayidle.nix
  ];
}
