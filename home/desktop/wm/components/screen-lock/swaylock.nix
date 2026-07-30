{
  config,
  pkgs,
  ...
}:
{
  # 屏幕锁定
  # https://github.com/swaywm/swaylock
  programs.swaylock = {
    enable = true;
    package = null;
    settings = {
      font = "JetBrainsMono Nerd Font Mono";
      font-size = 20;
      ignore-empty-password = true;
      show-failed-attempts = true;
      image = "${pkgs.home-assets}/wallpapers/scenery/5.jpg";
      indicator-radius = 120;
      indicator-thickness = 20;
      indicator-caps-lock = true;
      line-uses-inside = true;
      separator-color = "#a7acf066";

      # 默认状态(环: 浅蓝, 内部: 深紫半透明)
      color = "#1e1e2ee";
      ring-color = "#b4beffee";
      inside-color = "#11111bcc";
      key-hl-color = "#a6e3a1ee";
      bs-hl-color = "#f38ba8cc";
      disable-caps-lock-text = true;
      caps-lock-bs-hl-color = "#ed8796ee";
      caps-lock-key-hl-color = "#f5a97fee";

      # 输入验证中(验证状态: 蓝/青)
      ring-ver-color = "#89b4faee";
      inside-ver-color = "#11111bcc";

      # 密码错误 (错误状态: 柔和红)
      ring-wrong-color = "#f38ba8ee";
      inside-wrong-color = "#11111bcc";

      # 清除输入(清除状态: 黄)
      ring-clear-color = "#f9e2afee";
      inside-clear-color = "#11111bcc";

      # 大写锁定(Caps Lock: 橙)
      ring-caps-lock-color = "#fab387ee";
      inside-caps-lock-color = "#11111bcc";

      # 文字颜色
      text-color = "#cdd6f4ee";
      text-clear-color = "#cdd6f4ee";
      text-caps-lock-color = "#fab387ee";
      text-ver-color = "#89b4faee";
      text-wrong-color = "#f38ba8ee";
    };
  };
}
