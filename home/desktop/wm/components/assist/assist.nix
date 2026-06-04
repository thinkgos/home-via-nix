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
    ./ianny/ianny.nix
    # ./wluma.nix
  ];
}
