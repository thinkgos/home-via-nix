{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 密码管理器
  #
  programs.browserpass = {
    enable = true;
    browsers = [
      "chrome"
      "firefox"
    ];
  };
}
