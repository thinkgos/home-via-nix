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
    # mod + mouse:272 = 拖拽窗口(niri默认)
    # mod + mouse:273 = 缩放窗口(niri默认)
  };
}
