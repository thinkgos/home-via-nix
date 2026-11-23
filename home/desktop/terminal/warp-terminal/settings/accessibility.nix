{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#accessibility
  accessibility_verbosity = "verbose"; # 屏幕阅读器播报的详细程度: verbose 含帮助文本/concise 仅数值 (默认: "verbose")
}
