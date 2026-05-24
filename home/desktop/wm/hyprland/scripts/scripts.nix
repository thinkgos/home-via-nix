{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./control/control.nix
    ./picker/picker.nix
  ];
}
