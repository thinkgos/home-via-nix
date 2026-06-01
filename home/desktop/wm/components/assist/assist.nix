{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  imports = [
    ./swayosd/swayosd.nix
    ./ie-r.nix
    # ./wluma.nix
  ];
}
