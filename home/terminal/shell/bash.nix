{config, lib, pkgs, ...}: 
{
  programs.bash = {
    enable = true;
    # historyControl = ["erasedups" "ignoredups" "ignorespace" "ignoreboth"];
    historyFile = null;
    historyFileSize = 10000;
    historySize = 800;
    historyIgnore = [ 
      "exit"
      "clear"
      "history"
    ];
    shellOptions = [ 
      "histappend"
    ];
    shellAliases = {
      # see home.shellAliases for the top level attribute names 
      # here specific to bash
    };
  };
}