{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#code
  #
  # https://docs.warp.dev/terminal/settings/all-settings/#editor
  editor = {
    show_global_search = true; # 工具面板是否显示全局文件搜索 (默认: true)
    show_code_review_button = true; # 标签上是否显示代码审查按钮 (默认: true)
    show_project_explorer = true; # 工具面板是否显示项目浏览器 (默认: true)
  };
}
