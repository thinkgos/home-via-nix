{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    beekeeper-studio # 数据库管理工具
    dbeaver-bin # 数据库管理工具
    # sqlitebrowser # sqlite browser
    redisinsight # redis 可视化工具
    mqttx # MQTT 客户端
    kdePackages.kcachegrind # 性能分析工具
  ];
}
