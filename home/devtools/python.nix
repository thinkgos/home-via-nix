{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    uv # python包管理器
    ruff # python linter
  ];
}
