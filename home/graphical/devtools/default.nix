{ config, lib, pkgs, ... }: 
{
  home.packages = with pkgs;[
    dbeaver-bin  # 数据库管理工具
    redisinsight # redis 可视化工具
    mqttx         #  MQTT 客户端
  ];
}