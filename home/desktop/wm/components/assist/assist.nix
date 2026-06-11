{
  config,
  lib,
  pkgs,
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
