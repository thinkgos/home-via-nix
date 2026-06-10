{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Niri 窗口管理
  programs.niri.settings.binds = {
    "Mod+A" = {
      action.toggle-overview = { };
      repeat = false;
      hotkey-overlay.title = "视图预览";
    };
    # 窗口标签组
    "Mod+BracketLeft" = {
      action.consume-or-expel-window-left = { };
      repeat = false;
      hotkey-overlay.title = "吞噬或驱逐窗口-左边";
    };
    "Mod+BracketRight" = {
      action.consume-or-expel-window-right = { };
      repeat = false;
      hotkey-overlay.title = "吞噬或驱逐窗口-右边";
    };
    # 窗口管理
    "Mod+Q" = {
      action.close-window = { };
      repeat = false;
      hotkey-overlay.title = "关闭窗口";
    };
    "Mod+V" = {
      action.toggle-window-floating = { };
      repeat = false;
      hotkey-overlay.title = "切换浮动窗口";
    };
    "Mod+F" = {
      action.fullscreen-window = { };
      repeat = false;
      hotkey-overlay.title = "切换全屏模式";
    };
    "Mod+M" = {
      action.maximize-column = { };
      repeat = false;
      hotkey-overlay.title = "切换最大化模式";
    };

    "Mod+Tab" = {
      action.focus-column-right = { };
      repeat = false;
      hotkey-overlay.title = "聚焦下一个窗口";
    };
    "Mod+WheelScrollUp" = {
      action.focus-column-left = { };
      repeat = true;
      cooldown-ms = 300;
      # hotkey-overlay.title = "聚焦左边窗口-鼠标滚轮";
    };
    "Mod+WheelScrollDown" = {
      action.focus-column-right = { };
      repeat = true;
      cooldown-ms = 300;
      # hotkey-overlay.title = "聚焦右边窗口-鼠标滚轮";
    };
    # 聚焦窗口 (Mod+Arrow)
    "Mod+Left" = {
      action.focus-column-left = { };
      repeat = false;
      hotkey-overlay.title = "聚焦左边窗口";
    };
    "Mod+Right" = {
      action.focus-column-right = { };
      repeat = false;
      hotkey-overlay.title = "聚焦右边窗口";
    };
    "Mod+Up" = {
      action.focus-window-up = { };
      repeat = false;
      hotkey-overlay.title = "聚焦上方窗口";
    };
    "Mod+Down" = {
      action.focus-window-down = { };
      repeat = false;
      hotkey-overlay.title = "聚焦下方窗口";
    };
    # 聚焦窗口 (Mod+<HJKL>)
    "Mod+H" = {
      action.focus-column-left = { };
      repeat = false;
      hotkey-overlay.title = "聚焦左边窗口";
    };
    "Mod+L" = {
      action.focus-column-right = { };
      repeat = false;
      hotkey-overlay.title = "聚焦右边窗口";
    };
    "Mod+K" = {
      action.focus-window-up = { };
      repeat = false;
      hotkey-overlay.title = "聚焦上方窗口";
    };
    "Mod+J" = {
      action.focus-window-down = { };
      repeat = false;
      hotkey-overlay.title = "聚焦下方窗口";
    };
    # 移动窗口 (Mod+Shift+Arrow)
    "Mod+Shift+Left" = {
      action.move-column-left = { };
      repeat = false;
      hotkey-overlay.title = "移动窗口到左边";
    };
    "Mod+Shift+Right" = {
      action.move-column-right = { };
      repeat = false;
      hotkey-overlay.title = "移动窗口到右边";
    };
    "Mod+Shift+Up" = {
      action.move-window-up = { };
      repeat = false;
      hotkey-overlay.title = "移动窗口到上方";
    };
    "Mod+Shift+Down" = {
      action.move-window-down = { };
      repeat = false;
      hotkey-overlay.title = "移动窗口到下方";
    };

    # 工作区之间移动窗口
    "Mod+Shift+Prior" = {
      action.move-column-to-workspace-up = { };
      repeat = false;
      # hotkey-overlay.title = "移动窗口到上一个工作区";
    };
    "Mod+Shift+Next" = {
      action.move-column-to-workspace-down = { };
      repeat = false;
      # hotkey-overlay.title = "移动窗口到下一个工作区";
    };
    "Mod+Shift+Home" = {
      action.move-window-to-workspace = 1;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到第一个工作区";
    };
    "Mod+Shift+End" = {
      action.move-window-to-workspace = 9;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到最后一个工作区";
    };
    # 工作区之间移动窗口 (Mod+Shift+1-9)
    "Mod+Shift+1" = {
      action.move-window-to-workspace = 1;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区1";
    };
    "Mod+Shift+2" = {
      action.move-window-to-workspace = 2;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区2";
    };
    "Mod+Shift+3" = {
      action.move-window-to-workspace = 3;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区3";
    };
    "Mod+Shift+4" = {
      action.move-window-to-workspace = 4;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区4";
    };
    "Mod+Shift+5" = {
      action.move-window-to-workspace = 5;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区5";
    };
    "Mod+Shift+6" = {
      action.move-window-to-workspace = 6;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区6";
    };
    "Mod+Shift+7" = {
      action.move-window-to-workspace = 7;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区7";
    };
    "Mod+Shift+8" = {
      action.move-window-to-workspace = 8;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区8";
    };
    "Mod+Shift+9" = {
      action.move-window-to-workspace = 9;
      repeat = false;
      # hotkey-overlay.title = "移动窗口到工作区9";
    };
    # 列宽调整
    "Mod+C" = {
      action.center-column = { };
      repeat = false;
      hotkey-overlay.title = "居中列";
    };
    "Mod+R" = {
      action.switch-preset-column-width = { };
      repeat = false;
      hotkey-overlay.title = "切换预设列宽";
    };
    "Mod+Minus" = {
      action.set-column-width = "-5%";
      repeat = true;
      hotkey-overlay.title = "列宽减小5%";
    };
    "Mod+Equal" = {
      action.set-column-width = "+5%";
      repeat = true;
      hotkey-overlay.title = "列宽增大5%";
    };
    # 窗口高度调整
    "Mod+Alt+R" = {
      action.switch-preset-window-height = { };
      repeat = false;
      hotkey-overlay.title = "切换预设窗口高度";
    };
    "Mod+Alt+Minus" = {
      action.set-window-height = "-5%";
      repeat = true;
      hotkey-overlay.title = "窗口高度减小5%";
    };
    "Mod+Alt+Equal" = {
      action.set-window-height = "+5%";
      repeat = true;
      hotkey-overlay.title = "窗口高度增大5%";
    };
  };
}
