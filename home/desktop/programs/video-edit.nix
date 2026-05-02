{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  home.packages = with pkgs; [
    # https://github.com/Huanshere/VideoLingo 全自动搬运
    aegisub # 字幕编辑器 https://aegisub.org/zh-cn/docs/latest/main_page/
    subtitlecomposer # 字幕编辑器 https://subtitlecomposer.kde.org/
    # subtitleedit # 字幕编辑器 https://nikse.dk/subtitleedit
    ffsubsync # 字幕同步工具 https://github.com/smacke/ffsubsync
    python313Packages.subliminal # 字幕下载工具 https://github.com/Diaoul/subliminal
  ];
}
