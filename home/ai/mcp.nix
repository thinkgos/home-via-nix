{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.mcp = {
    enable = true;
    servers = {
      # "" = {
      #   enabled = true;
      #   env = { };
      #   headers = { };
      #   url = "";
      #   command = "";
      #   args = [ ];
      # };
    };
  };
}
