{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    ansible # 配置管理工具
    ansible-lint # 检查ansible playbook语法
  ];
}
