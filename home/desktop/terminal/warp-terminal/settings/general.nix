{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#general
  default_session_mode = "terminal"; # 新会话的默认模式: terminal/agent/cloud_agent/tab_config/docker_sandbox (默认: "terminal")
  default_tab_config_path = ""; # default_session_mode 为 "tab_config" 时使用的 tab config 路径 (默认: "")
  link_tooltip = true; # 悬停在链接上时是否显示工具提示 (默认: true)
  login_item = true; # 登录系统时是否自动启动 Warp (默认: true)
  mouse_scroll_multiplier = 3.0; # 鼠标滚轮的滚动速度倍数 (默认: 3.0)
  new_tab_placement = "after_current_tab"; # 新标签页插入位置: after_current_tab/after_all_tabs (默认: "after_current_tab")
  preserve_input_focus_on_block_selection = false; # 选中终端块时输入框是否保持焦点 (默认: false)
  quit_on_last_window_closed = false; # 关闭最后一个窗口时是否退出 Warp (默认: false)
  restore_session = true; # 启动时是否恢复上次会话 (默认: true)
  should_confirm_close_session = true; # 关闭会话时是否显示确认对话框 (默认: true)
  show_changelog_after_update = true; # 更新后是否显示更新日志 (默认: true)
  show_warning_before_quitting = true; # 退出 Warp 前是否显示警告对话框 (默认: true)
  snackbar_enabled = true; # 是否显示 snackbar 通知 (默认: true)
  user_native_preference = "not_selected"; # 偏好原生桌面应用还是 Web 应用: not_selected/web/desktop (默认: "not_selected")
  # https://docs.warp.dev/terminal/settings/all-settings/#undo-close
  undo_close = {
    enabled = true; # 是否启用撤销关闭标签页功能 (默认: true)
    grace_period = 60; # 关闭标签页后仍可撤销的时间, 单位秒 (默认: 60)
  };
}
