{
  config,
  lib,
  pkgs,
  ...
}:
let
  lib' = import ../lib/lib.nix { inherit config lib pkgs; };
  mkShell =
    name: src:
    pkgs.writeShellScriptBin name ''
      source ${lib'.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile src}
    '';
in
{
  home.packages = [
    lib'.log4sh
    (mkShell "fzf-preview" ./fzf-preview.sh)
    (mkShell "git-submodule" ./git-submodule.sh)
  ];
}
