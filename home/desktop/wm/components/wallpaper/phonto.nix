{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 壁纸 GPU-accelerated video
  # https://github.com/museslabs/phonto
  home.packages = [ pkgs.phonto ];
}
