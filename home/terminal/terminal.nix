{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./shell/shell.nix
    ./programs/programs.nix
    ./devtools/devtools.nix
    ./editor/editor.nix
    ./ai/ai.nix
    ./fun/fun.nix
  ];
}
