{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  programs.niri.settings.binds = {
    # 鼠标绑定 ✅
    # mod + mouse:272 = 拖拽窗口 - 鼠标左键(niri默认)
    # mod + mouse:273 = 缩放窗口 - 鼠标右键(niri默认)
    # 鼠标滚轮 ✅
    "Mod+WheelScrollUp" = {
      action.focus-column-left = { };
      repeat = true;
      cooldown-ms = 300;
      # hotkey-overlay.title = "聚焦左边窗口 - 鼠标滚轮向上";
    };
    "Mod+WheelScrollDown" = {
      action.focus-column-right = { };
      repeat = true;
      cooldown-ms = 300;
      # hotkey-overlay.title = "聚焦右边窗口 - 鼠标滚轮向下";
    };
    "Mod+Shift+WheelScrollUp" = {
      action.move-column-left = { };
      repeat = true;
      cooldown-ms = 300;
      # hotkey-overlay.title = "聚焦左边窗口 - 鼠标滚轮向上";
    };
    "Mod+Shift+WheelScrollDown" = {
      action.move-column-right = { };
      repeat = true;
      cooldown-ms = 300;
      # hotkey-overlay.title = "聚焦右边窗口 - 鼠标滚轮向下";
    };
  };
}
