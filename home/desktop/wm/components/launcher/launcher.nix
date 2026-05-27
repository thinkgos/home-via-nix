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
    ./raffi/raffi.nix
    ./rofi/rofi.nix
    ./vicinae/vicinae.nix
  ];
}
