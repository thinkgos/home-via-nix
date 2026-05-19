{
  lib,
  pkgs,
  ...
}:
let
  log4sh = pkgs.writeTextFile {
    name = "log4sh";
    destination = "/lib/shell/log4sh.sh";
    text = (builtins.readFile ./lib/log4sh.sh);
  };
  mkShell =
    name: src:
    pkgs.writeShellScriptBin name ''
      source ${log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile src}
    '';
in
{
  log4sh = log4sh;

  fzf-preview = pkgs.writeShellApplication {
    name = "fzf-preview";
    text = ''
      source ${log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./scripts/shortcut/fzf-preview.sh}
    '';
    excludeShellChecks = [ "SC1091" ];
    runtimeInputs = with pkgs; [
      fzf
      fd
      ripgrep
      bat
      jq
      vim
      wl-clipboard
    ];
  };

  git-submodule = pkgs.writeShellApplication {
    name = "git-submodule";
    text = ''
      source ${log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./scripts/shortcut/git-submodule.sh}
    '';
    excludeShellChecks = [ "SC1091" ];
    runtimeInputs = with pkgs; [
      git
      parallel
    ];
  };
}
