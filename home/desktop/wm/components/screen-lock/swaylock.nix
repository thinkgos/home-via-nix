{
  config,
  pkgs,
  ...
}:
{
  # 屏幕锁定
  # https://github.com/swaywm/swaylock
  xdg.configFile."swaylock/config".text = ''
    font=JetBrainsMono Nerd Font Mono
    font-size=20
    ignore-empty-password
    show-failed-attempts
    image=${config.xdg.dataHome}/wallpapers/scenery/5.jpg
    indicator-radius=120
    indicator-thickness=20
    indicator-caps-lock
    line-uses-inside
    separator-color=#181926

    # 默认状态(环: 浅蓝, 内部: 深紫半透明)
    color=1e1e2eff
    ring-color=b4befeff
    inside-color=1111beee
    key-hl-color=a6e3a1ff
    bs-hl-color=f38ba8ee
    disable-caps-lock-text
    caps-lock-bs-hl-color=#ed8796
    caps-lock-key-hl-color=#f5a97f

    # 输入验证中(验证状态: 蓝/青)
    ring-ver-color=89b4faff
    inside-ver-color=1111beee

    # 密码错误 (错误状态: 柔和红)
    ring-wrong-color=f38ba8ff
    inside-wrong-color=1111beee

    # 清除输入(清除状态: 黄)
    ring-clear-color=f9e2afff
    inside-clear-color=1111beee

    # 大写锁定(Caps Lock: 橙)
    ring-caps-lock-color=fab387ff
    inside-caps-lock-color=1111beee

    # 文字颜色
    text-color=cdd6f4ff
    text-clear-color=cdd6f4ff
    text-caps-lock-color=fab387ff
    text-ver-color=89b4faff
    text-wrong-color=f38ba8ff
  '';

}
