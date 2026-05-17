{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
      # https://github.com/Huanshere/VideoLingo 全自动搬运
  home.packages = with pkgs; []
   ++ lib.optional (builtins.elem "aegisub" customize.apps)  aegisub # 字幕编辑器 https://aegisub.org/zh-cn/docs/latest/main_page/
   ++ lib.optional (builtins.elem "subtitlecomposer" customize.apps)  subtitlecomposer # 字幕编辑器 https://subtitlecomposer.kde.org/
   ++ lib.optional (builtins.elem "subtitleedit" customize.apps)  subtitleedit # 字幕编辑器 https://nikse.dk/subtitleedit
   ++ lib.optional (builtins.elem "ffsubsync" customize.apps)  ffsubsync # 字幕同步工具 https://github.com/smacke/ffsubsync
   ++ lib.optional (builtins.elem "subliminal" customize.apps)  python313Packages.subliminal ;# 字幕下载工具 https://github.com/Diaoul/subliminal
}
