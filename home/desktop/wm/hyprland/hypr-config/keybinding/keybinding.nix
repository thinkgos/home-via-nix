{
  config,
  lib,
  pkgs,
  wme,
  customize,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  imports = [
    ./system.nix
    ./launcher.nix
    ./screenshot.nix
    ./mouse.nix
    ./layout.nix
    ./workspace.nix
    ./window.nix
    ./function-key.nix
  ];

  # Hyprland 键盘绑定
  # https://wiki.hypr.land/Configuring/Binds/
  wayland.windowManager.hyprland = {
    # NOTE:
    # `Super` + `W`: 显示工作区和应用启动器概览(hyprshell支持)
    # `Alt` + `Tab`: 切换应用程序(hyprshell支持)
    settings = {
      # local variable
      settingsNumWorkspaces = {
        _var = 4; # 最大9
      };
      mod = {
        _var = "SUPER";
      };
      launchTerminal = {
        _var = "${pkgs.alacritty}/bin/alacritty";
      };
      launchDropdownTerminal = {
        _var = wme.misc.dropdown-terminal;
      };
      launchFileManager = {
        _var = "${pkgs.nemo}/bin/nemo";
      };
      launchCalculator = {
        _var = "/bin/pkill qalculate-gtk || ${pkgs.qalculate-gtk}/bin/qalculate-gtk";
      };
      launchBrowser = {
        _var = "google-chrome";
      };
      launchIde = {
        _var = "code";
      };
      launchScreenRecorder = {
        _var = "/bin/pkill kooha || flatpak run io.github.seadve.Kooha";
      };
      popupAppLauncher = {
        _var = "/bin/pkill rofi || ${pkgs.rofi}/bin/rofi -show drun";
      };
      popupKeybindingHelp = {
        _var = "hyprkcs";
      };
      actionToggleWaybar = {
        _var = "${pkgs.hvn}/bin/hvn-toggle-waybar";
      };
      actionLockScreen = {
        _var = wme.power.lock;
      };

      bind = [ ];
    };
    # https://github.com/shezdy/hyprsplit
    # hyprsplit 插件配置通过 extraConfig 设置
    extraConfig = ''
       -- hyprsplit 插件配置
       hl.plugin.hyprsplit = require("hyprsplit")

       local hs = hl.plugin.hyprsplit

       -- 配置工作区数量
       hs.config( { num_workspaces = settingsNumWorkspaces } )

       -- 收集孤立窗口
       hl.bind(mod .. "+ 0", hs.dsp.grab_rogue_windows())
       -- 聚焦工作区
       hl.bind(mod .. "+ mouse_down", hs.dsp.focus({ workspace = "r-1" }))
       hl.bind(mod .. "+ mouse_up", hs.dsp.focus({ workspace = "r+1" }))
       hl.bind(mod .. "+ Prior", hs.dsp.focus({ workspace = "r-1" }))
       hl.bind(mod .. "+ Next", hs.dsp.focus({ workspace = "r+1" }))
       hl.bind(mod .. "+ Home", hs.dsp.focus({ workspace = 1 }))
       hl.bind(mod .. "+ End", hl.dsp.exec_cmd("${wme.misc.focus-last-workspace} -m split-workspace"))
       -- 聚焦工作区 (Mod+1-9 — same as niri)
       for i = 1, settingsNumWorkspaces do
         hl.bind(mod .. "+ " .. i, hs.dsp.focus({ workspace = i }))
       end
       -- 工作区中移动窗口
       hl.bind(mod .. "+ SHIFT + Prior", hs.dsp.window.move({ workspace = "r-1" }))
       hl.bind(mod .. "+ SHIFT + Next", hs.dsp.window.move({ workspace = "r+1" }))
       hl.bind(mod .. "+ SHIFT + Home", hs.dsp.window.move({ workspace = 1 }))
       hl.bind(mod .. "+ SHIFT + End", hl.dsp.exec_cmd("${wme.misc.focus-last-workspace} -m split-window-move-workspace"))
      -- 工作区中移动窗口 (Mod+Shift+1-9 — same as niri)
       for i = 1, settingsNumWorkspaces do
         hl.bind(mod .. "+ SHIFT + " .. i, hs.dsp.window.move({ workspace = i }))
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
    "hypr/hyprsplit/init.lua".source = "${pkgs.hyprsplit}/init.lua";
  };
}
