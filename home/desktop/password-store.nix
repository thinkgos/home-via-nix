{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 密码管理器的native, 需要配置浏览器插件.
  # https://github.com/browserpass/browserpass-native
  # https://github.com/browserpass/browserpass-extension
  # 如果发现浏览器插件用不了, 尝试重装下插件
  programs.browserpass = {
    enable = true;
    browsers = [
      "chrome"
      "firefox"
    ];
  };
}
