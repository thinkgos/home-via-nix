{
  config,
  lib,
  pkgs,
  ...
}:
{

  # 颜色拾取器
  # https://github.com/miaupaw/ie-r
  xdg.autostart.entries = [
    "${pkgs.ie-r}/share/applications/ie-r.desktop"
  ];
}
