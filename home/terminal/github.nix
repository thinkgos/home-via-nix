{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.gh = {
    enable = true;
    # https://cli.github.com/manual/gh_extension
    extensions = with pkgs; [

    ];
    hosts = {
      "github.com" = {
        user = "thinkgo";
        git_protocol = "ssh";
      };
    };
    settings = {
      editor = "vim";
      git_protocol = "ssh";
      aliases = {

      };
    };
  };
}
