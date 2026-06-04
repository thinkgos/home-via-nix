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

  # avoid repetitive strain injury
  # 提醒预防重复性劳损/RSI的久坐提醒
  # https://github.com/zefr0x/ianny
  xdg.configFile = {
    "autostart/io.github.zefr0x.ianny.desktop".text = ''
      [Desktop Entry]
      Version=1.5
      Type=Application
      Name=Ianny
      Name[ar]=عَيْنِي
      GenericName=Break Notifier
      GenericName[ar]=مُنَبِّهُ اِستِرَاحَة
      Comment=Help preventing repetitive strain injuries by keeping track of usage patterns and periodically informing user to take breaks.
      Comment[ar]=يُساعِدُ فِي تَجَنُّبِ إصَابَاتِ الإجهَادِ المُتَكَرِّرِ مِن خِلَالِ تَتَبُّعِ أنمَاطِ الاِستِخدَامِ وَتَذكِيِرِ المُستَخدِمِ بِشَكلٍ دَورِيٍّ لِأخذِ اِستِرَاحَات
      Exec=${pkgs.ianny}/bin/ianny
      NoDisplay=true
      Terminal=false
      SingleMainWindow=true
      Categories=Utility
      Keywords=RSI;eye;break;
      Keywords[ar]=إجهاد;عين;استراحة;
      X-GNOME-Autostart-enabled=true
    '';
    "io.github.zefr0x.ianny/config.toml".source = ./config.toml;
  };

}
