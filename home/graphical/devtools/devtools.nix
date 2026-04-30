{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      beekeeper-studio # 数据库工具
      dbeaver-bin # 数据库管理工具
      # sqlitebrowser # sqlite browser
      mqttx # MQTT 客户端
      kdePackages.kcachegrind # 性能分析工具
    ]
    ++ lib.optionals (!customize.disable-long-build) [
      redisinsight # redis 可视化工具
    ];
}
