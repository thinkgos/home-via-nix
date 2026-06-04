{
  config,
  lib,
  pkgs,
  ...
}:
{
  power = {
    lock = "/bin/notify-send -u critical 'TODO: 待实现'";
    logout = "/bin/notify-send -u critical 'TODO: 待实现'";
    shutdown = "/bin/systemctl poweroff";
    reboot = "/bin/systemctl reboot";
    # 休眠是写到swap文件(swap空间必须大于内存), 需要主板与BIOS/UEFI支持(主板必须支持ACPI S4状态)
    # hibernate = "/bin/systemctl hibernate";
    hibernate = "/bin/notify-send -u critical '系统暂不支持休眠(hibernate)!'";
    suspend = "/bin/systemctl suspend";
  };
  pkgs = { };
}
