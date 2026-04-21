{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 邮件客户端
  programs.thunderbird = {
    enable = true;
    profiles = { };
  };
}
