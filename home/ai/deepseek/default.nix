{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 
  # TODO: ...
  home.packages = with pkgs; [
    deepseek-harness
  ];
}
