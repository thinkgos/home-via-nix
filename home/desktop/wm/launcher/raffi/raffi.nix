{
  config,
  lib,
  pkgs,
  ...
}:
{
  # raffi 应用启动器
  home.packages = [ pkgs.raffi ];
}
