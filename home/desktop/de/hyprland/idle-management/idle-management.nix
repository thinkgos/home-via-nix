{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 空闲管理
  imports = [
    ./hypridle.nix
    # ./swayidle.nix
  ];
}
