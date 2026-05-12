{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.writeShellScriptBin "fzf-preview" (builtins.readFile ./fzf-preview.sh))
    (pkgs.writeShellScriptBin "git-submodule" (builtins.readFile ./git-submodule.sh))
  ];
}
