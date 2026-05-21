{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./control/control.nix
    ./popup/popup.nix
    ./picker/picker.nix
    ./run/run.nix
  ];
}
