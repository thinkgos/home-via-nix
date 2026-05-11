{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 应用启动器
  imports = [
    ./wofi/wofi.nix
    ./fuzzel/fuzzel.nix
  ];
}
