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
    open_file_editor = "system_default"; # 打开文件使用的编辑器: "system_default"/"warp"/"env_editor"/{ external_editor = "zed" } (默认: "system_default")
    open_code_panels_file_editor = "warp"; # 从代码面板打开文件使用的编辑器, 取值同 open_file_editor (默认: "warp")
    open_file_layout = "split_pane"; # 编辑器中打开文件的布局: split_pane/new_tab (默认: "split_pane")
    prefer_markdown_viewer = true; # 打开 Markdown 文件时是否使用 Markdown 查看器 (默认: true)
    prefer_tabbed_editor_view = true; # 是否优先使用标签页式编辑器视图打开文件 (默认: true)
    show_code_review_button = true; # 标签上是否显示代码审查按钮 (默认: true)
    auto_open_code_review_pane_on_first_agent_change = false; # Agent 首次修改代码时是否自动打开代码审查面板 (默认: false)
    show_code_review_diff_stats = true; # 代码审查按钮上是否显示增删行数统计 (默认: true)
    show_project_explorer = true; # 工具面板是否显示项目浏览器 (默认: true)
    show_global_search = true; # 工具面板是否显示全局文件搜索 (默认: true)
    show_hidden_files = true; # 项目浏览器中是否显示隐藏文件(dotfiles) (默认: true)
    use_warp_as_default_editor = false; # 是否将 Warp 用作默认代码编辑器 (默认: false)
    format_on_save = true; # 保存时语言服务器是否自动格式化文件 (默认: true)
    auto_save = false; # 文本编辑器是否在输入和失焦时自动保存 (默认: false)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#indexing
  indexing = {
    agent_mode_codebase_context = true; # 是否向 Agent 提供代码库上下文 (默认: true)
    agent_mode_codebase_context_auto_indexing = false; # 是否启用代码库自动索引 (默认: false)
  };
}
