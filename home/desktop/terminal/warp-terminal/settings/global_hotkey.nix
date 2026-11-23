{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#global-hotkey
  # 注意: 启用原生 Wayland 时不支持全局热键 (system.force_x11 = false)
  #
  # https://docs.warp.dev/terminal/settings/all-settings/#toggle-all-windows
  toggle_all_windows = {
    enabled = false; # 是否启用显示/隐藏所有窗口的全局热键, 与 dedicated_window.enabled 互斥 (默认: false)
    # keybinding 未设置(null 表示未分配), 格式为修饰键与按键用 "-" 连接, 如 "ctrl-shift-a"/"alt-enter" (默认: null)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#dedicated-window-quake-mode
  dedicated_window = {
    enabled = false; # 是否启用专属热键窗口(Quake 模式), 与 toggle_all_windows.enabled 互斥 (默认: false)
    settings = {
      active_pin_position = "top"; # 热键窗口吸附的屏幕边缘: top/bottom/left/right (官方示例值)
      hide_window_when_unfocused = true; # 失去焦点时是否隐藏热键窗口 (官方示例值)
      # keybinding = "ctrl-`"; # 切换热键窗口的按键, 未设置时为 null (默认: null)
      # pin_screen = "primary"; # 吸附的显示器: "primary"/{ external = 1 }/null (默认: null)
      pin_position_to_size_percentages = { # 各屏幕边缘的窗口尺寸百分比 (官方示例值)
        top = {
          width = 100;
          height = 30;
        };
        bottom = {
          width = 100;
          height = 30;
        };
        left = {
          width = 40;
          height = 100;
        };
        right = {
          width = 40;
          height = 100;
        };
      };
    };
  };
}
