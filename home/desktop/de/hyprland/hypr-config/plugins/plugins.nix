{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  mod = "SUPER";
  num_workspaces = "4"; # 最大9
in
{
  # https://wiki.hypr.land/Plugins/Using-Plugins/
  # https://hypr.land/plugins/

  # https://github.com/shezdy/hyprsplit
  wayland.windowManager.hyprland = {
    # hyprsplit 插件配置通过 extraConfig 设置
    extraConfig = ''
       -- hyprsplit 插件配置
       hl.plugin.hyprsplit = require("hyprsplit")
       local hs = hl.plugin.hyprsplit

       -- 配置工作区数量
       hs.config( { num_workspaces = ${num_workspaces} } )

       -- 收集孤立窗口
       hl.bind("${mod} + 0", hs.dsp.grab_rogue_windows())
       -- 工作区切换
       hl.bind("${mod} + mouse_down", hs.dsp.focus({ workspace = "r-1" }))
       hl.bind("${mod} + mouse_up", hs.dsp.focus({ workspace = "r+1" }))
       hl.bind("${mod} + Prior", hs.dsp.focus({ workspace = "r-1" }))
       hl.bind("${mod} + Next", hs.dsp.focus({ workspace = "r+1" }))
       hl.bind("${mod} + Home", hs.dsp.focus({ workspace = 1 }))
       hl.bind("${mod} + End", hl.dsp.exec_cmd("blast-switch-last-workspace -m split-workspace"))
       -- 切换到工作区 (Mod+1-9 — same as niri)
       for i = 1, ${num_workspaces} do
         hl.bind("${mod} + " .. i, hs.dsp.focus({ workspace = i }))
       end
       -- 工作区移动
       hl.bind("${mod} + SHIFT + Prior", hs.dsp.window.move({ workspace = "r-1" }))
       hl.bind("${mod} + SHIFT + Next", hs.dsp.window.move({ workspace = "r+1" }))
       hl.bind("${mod} + SHIFT + Home", hs.dsp.window.move({ workspace = 1 }))
       hl.bind("${mod} + SHIFT + End", hl.dsp.exec_cmd("blast-switch-last-workspace -m split-window-move-workspace"))
      -- 移动到工作区 (Mod+Shift+1-9 — same as niri)
       for i = 1, ${num_workspaces} do
         hl.bind("${mod} + SHIFT + " .. i, hs.dsp.window.move({ workspace = i }))
       end
    ''
    + (
      if customize.desktop.monitor-secondary != "" then
        ''hs.monitor_priority({ "${customize.desktop.monitor-primary}", "${customize.desktop.monitor-secondary}" })''
      else
        ''hs.monitor_priority({ "${customize.desktop.monitor-primary}" })''
    );
  };

  xdg.configFile = {
    "hypr/hyprsplit"   = {
      source = "${pkgs.hyprsplit}/share/hyprsplit";
      recursive = true;
    };
  };
}
