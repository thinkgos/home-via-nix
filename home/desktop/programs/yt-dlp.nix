{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 视频下载工具
  programs.yt-dlp = {
    enable = builtins.elem "yt-dlp" customize.apps;
    # https://github.com/yt-dlp/yt-dlp#configuration
    settings = {
      embed-thumbnail = true;
      embed-subs = true;
      write-subs = true;
      write-auto-subs = true;
      convert-subs = "srt";
      limit-rate = "2M";
      sleep-subtitles = 5;
      sub-langs = "en,zh-Hans";
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x6 -s6 -k10M'";
      user-agent = "\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36\"";
      paths = [
        "home:~/Videos/dlp"
      ];
      # 针对单个视频
      output = "%(uploader)s/%(id)s/%(title)50s_%(upload_date)s.%(ext)s";
      # 针对播放列表
      # output = "%(uploader)s/%(playlist)s/%(playlist_index)02d_%(title)50s_%(upload_date)s.%(ext)s";
      # 针对分段视频(如多p)
      # output = "%(uploader)s/%(id)s/P%(part_number)s_%(upload_date)s.%(ext)s";
    };
    # extraConfig = "";
  };
}
