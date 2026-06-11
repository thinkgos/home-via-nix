{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.niri.settings.binds = {
    "Mod+Prior" = {
      action.focus-workspace-up = { };
      repeat = false;
      # hotkey-overlay.title = "聚焦上一工作空间";
    };
    "Mod+Next" = {
      action.focus-workspace-down = { };
      repeat = false;
      # hotkey-overlay.title = "聚焦下一工作空间";
    };
    "Mod+Home" = {
      action.focus-workspace = 1;
      repeat = false;
      # hotkey-overlay.title = "聚焦第一个工作空间";
    };
    "Mod+End" = {
      action.focus-workspace = 9;
      repeat = false;
      # hotkey-overlay.title = "聚焦最后一个工作空间";
    };
    "Mod+1" = {
      action.focus-workspace = 1;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间1";
    };
    "Mod+2" = {
      action.focus-workspace = 2;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间2";
    };
    "Mod+3" = {
      action.focus-workspace = 3;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间3";
    };
    "Mod+4" = {
      action.focus-workspace = 4;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间4";
    };
    "Mod+5" = {
      action.focus-workspace = 5;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间5";
    };
    "Mod+6" = {
      action.focus-workspace = 6;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间6";
    };
    "Mod+7" = {
      action.focus-workspace = 7;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间7";
    };
    "Mod+8" = {
      action.focus-workspace = 8;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间8";
    };
    "Mod+9" = {
      action.focus-workspace = 9;
      repeat = false;
      # hotkey-overlay.title = "聚焦工作空间9";
    };
  };
}
