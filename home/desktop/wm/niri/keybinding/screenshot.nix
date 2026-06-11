{
  config,
  lib,
  pkgs,

  ...
}:
{
  programs.niri.settings.binds = {
    # "Mod+Alt+R" = {
    #   action.spawn = [
    #     "sh"
    #     "-c"
    #     "/bin/pkill kooha || flatpak run io.github.seadve.Kooha"
    #   ];
    #   repeat = false;
    #   hotkey-overlay.title = "交互式录屏";
    # };
    "Alt+Print" = {
      action.screenshot-window = {
        show-pointer = true;
      };
      repeat = false;
      hotkey-overlay.title = "窗口截图";
    };
    "Shift+Print" = {
      action.screenshot-screen = {
        show-pointer = true;
      };
      repeat = false;
      hotkey-overlay.title = "全屏截图";
    };
    "Print" = {
      action.screenshot = {
        show-pointer = true;
      };
      repeat = false;
      hotkey-overlay.title = "选框截图";
    };
    "Mod+Print" = {
      action.spawn = [
        "${pkgs.flameshot}/bin/flameshot"
        "gui"
      ];
      repeat = false;
      hotkey-overlay.title = "选框截图标注";
    };
  };
}
