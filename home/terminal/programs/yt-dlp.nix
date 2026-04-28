{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 视频下载工具
  programs.yt-dlp = {
    enable = true;
    # https://github.com/yt-dlp/yt-dlp#configuration
    settings = {
      embed-thumbnail = true;
      embed-subs = true;
      sub-langs = "all";
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
    };
    # extraConfig = "";
  };
}
