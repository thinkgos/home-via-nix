{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 账户
  accounts = {
    email = {
      accounts = {
        # primary account
        "thinkgo@aliyun.com" = {
          enable = true;
          primary = true;
          realName = "thinkgo";
          userName = "thinkgo@aliyun.com";
          address = "thinkgo@aliyun.com";
          flavor = "plain";
          imap = {
            authentication = "login";
            host = "imap.aliyun.com";
            port = 993;
            tls = {
              enable = true;
              useStartTls = false;
            };
          };
          smtp = {
            authentication = "login";
            host = "smtp.aliyun.com";
            port = 465;
            tls = {
              enable = true;
              useStartTls = false;
            };
          };
          thunderbird = {
            enable = true;
            profiles = [ "default" ];
          };
        };
        # secondary account
        "thinkgo510@gmail.com" = {
          enable = true;
          primary = false;
          realName = "thinkgo";
          userName = "thinkgo510@gmail.com";
          address = "thinkgo510@gmail.com";
          flavor = "gmail.com";
          imap = {
            # authentication = "oauth2";
            host = "imap.gmail.com";
            port = 993;
            tls = {
              enable = true;
              useStartTls = false;
            };
          };
          smtp = {
            # authentication = "oauth2";
            host = "smtp.gmail.com";
            port = 465;
            tls = {
              enable = true;
              useStartTls = false;
            };
          };
          thunderbird = {
            enable = true;
            profiles = [ "default" ];
          };
        };
      };
    };
  };
}
