{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 邮件客户端
  programs.thunderbird = {
    enable = true;
    profiles = {
      "default" = {
        isDefault = true;
      };
    };
    settings = {

    };
  };
}
