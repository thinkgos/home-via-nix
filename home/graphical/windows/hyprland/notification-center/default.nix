{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 通知中心
  # mako 极简通知中心
  # https://github.com/emersion/mako/blob/master/doc/mako.5.scd
  # https://github.com/catppuccin/mako

  # swaync 全功能通知中心
  # https://github.com/ErikReider/SwayNotificationCenter

  services.mako = {
    enable = true;
    # Catppuccin Mocha 配色
    # 注意, 颜色不支持rgba格式, 只能使用hex格式
    settings = {
      font = ''"FiraCode Nerd Font Mono" 11''; # 字体

      layer = "overlay"; # 通知显示层
      anchor = "top-center"; # 屏幕位置
      margin = 10; # 通知与屏幕边框的间距
      markup = true; # 是否启用Pango markup
      actions = true; # 是否启用关联操作
      background-color = "#1E1E2ED8"; # 背景颜色 (rgba(30, 30, 46, 0.85))
      width = 300; # 通知宽度
      height = 110; # 通知高度

      text-color = "#CDD6F4D8"; # 文本颜色 (rgba(205, 214, 244, 0.85))
      progress-color = "over #313244D8"; # 进度条颜色 (over rgba(49, 50, 68, 0.85))

      icons = 1; # 是否显示图标
      max-icon-size = 64; # 最大图标大小
      icon-location = "left"; # 图标位置
      icon-border-radius = 5; # 图标圆角半径

      default-timeout = 10000; # 通知显示时间
      ignore-timeout = false; # 是否命令行忽略超时时间

      # 边框
      border-color = "#89DCEBD8"; # 边框颜色 (rgba(137, 220, 235, 0.85))
      border-size = 2; # 边框宽度
      border-radius = 10; # 边框圆角半径

      "urgency=critical" = {
        border-color = "#FAB387D8"; # rgba(250, 179, 135, 0.85)
        default-timeout = 0;
      };
    };
  };
}
