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
      codegraph = {
        enabled = true;
        command = "codegraph";
        args = [
          "serve"
          "--mcp"
        ];
      };
      drawio = {
        enabled = true;
        command = "drawio-mcp";
        args = [ ];
      };
    };
  };
}
