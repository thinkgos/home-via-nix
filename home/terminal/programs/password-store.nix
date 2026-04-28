{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 密码管理器
  # https://github.com/browserpass/browserpass-native
  # https://github.com/browserpass/browserpass-extension
  # 如果发现浏览器插件用不了, 尝试重装下插件
  # workflows
  # gpg 密钥对
  #   gpg --list-secret-keys # 查看密钥
  #   gpg --full-generate-key # 生成密钥, 建议使用ecc25519算法
  # pass管理密码
  #   pass init gpg-key-id... # 初始化
  #   pass insert -m x/xx/xxx # 插入密码
  #   pass generate x/xx/xxx 10 # 生成10位随机密码
  #   pass show x/xx/xxx # 查看密码
  # 更换设备
  #   旧设备:
  #     gpg --armor --export [用户ID/KeyID] > public.asc # 导出公钥
  #     gpg --armor --export-secret-keys [用户ID/KeyID] > private.asc
  #     gpg --export-ownertrust > trustdb.txt # 导出信任数据库
  #   新设备:
  #     gpg --import public.asc
  #     gpg --import private.asc
  #     gpg --import trustdb.txt
  programs.password-store = {
    enable = true;
    settings = {
      # 位置: ~/.local/share/password-store
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    };
  };
}
