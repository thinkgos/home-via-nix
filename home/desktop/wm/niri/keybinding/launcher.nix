{
  config,
  lib,
  pkgs,
  wme,
  customize,
  ...
}:
{
  programs.niri.settings.binds = {
    "Mod+T" = {
      action.spawn = [ "${pkgs.alacritty}/bin/alacritty" ];
      repeat = false;
      hotkey-overlay.title = "启动终端";
    };
    "Mod+N" = {
      action.spawn = [
        "${pkgs.alacritty}/bin/alacritty"
        "--class"
        "floating-terminal"
        "--title"
        "floating-terminal"
      ];
      repeat = false;
      hotkey-overlay.title = "启动浮动终端";
    };
    "Mod+Alt+N" = {
      action.spawn = [ "warp-terminal" ];
      repeat = false;
      hotkey-overlay.title = "启动wrap终端";
    };
    "Mod+E" = {
      action.spawn = [ "${pkgs.nemo}/bin/nemo" ];
      repeat = false;
      hotkey-overlay.title = "启动文件管理器";
    };
    "Mod+B" = {
      action.spawn = [ "google-chrome-stable" ];
      repeat = false;
      hotkey-overlay.title = "启动浏览器";
    };
    "Mod+P" = {
      action.spawn = [ "code" ];
      repeat = false;
      hotkey-overlay.title = "启动IDE";
    };
    "Mod+Grave" = {
      action.spawn = [
        "${pkgs.piri}/bin/piri"
        "scratchpads"
        "dropdown-terminal"
        "toggle"
      ];
      repeat = false;
      hotkey-overlay.title = "启动下拉终端";
    };
    "Mod+D" = {
      action.spawn = [
        "sh"
        "-c"
        "${pkgs.anyrun}/bin/anyrun close || ${pkgs.anyrun}/bin/anyrun"
      ];
      repeat = false;
      hotkey-overlay.title = "启动应用启动器";
    };
    "Mod+Space" = {
      action.spawn = [
        "${pkgs.vicinae}/bin/vicinae"
        "toggle"
      ];
      repeat = false;
      hotkey-overlay.title = "启动多功能启动器";
    };
    "Mod+F1" = {
      action.show-hotkey-overlay = { };
      repeat = false;
      hotkey-overlay.title = "启动帮助按键绑定";
    };
  };
}
