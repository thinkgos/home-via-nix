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
    ./ianny.nix
    # ./wluma.nix
  ];
}
