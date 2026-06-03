{
  config,
  lib,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    ianny
  ];

  #  avoid repetitive strain injury
  # https://github.com/zefr0x/ianny
  xdg.autostart.entries = [
    "${pkgs.ianny}/etc/xdg/autostart/io.github.zefr0x.ianny.desktop"
  ];
}
