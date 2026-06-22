{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./mcp.nix
    ./claude
    # ./codex
  ];

  home.packages = with pkgs; [
    rtk # harness proxy

    # claude only
    CCometixLine # claude code status line
  ];
}
