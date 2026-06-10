{
  config,
  lib,
  pkgs,
  ...
}:
let
  localpkgs = pkgs.callPackage ./packages { };
in
{
  power = {
    lock = "/bin/loginctl lock-session && sleep 1 && ${pkgs.niri-unstable}/bin/niri msg action power-off-monitors";
    logout = "/bin/notify-send -u critical '注销有BUG(logout)!'";
    shutdown = "/bin/systemctl poweroff";
    reboot = "/bin/systemctl reboot";
    # 休眠是写到swap文件(swap空间必须大于内存), 需要主板与BIOS/UEFI支持(主板必须支持ACPI S4状态)
    # hibernate = "/bin/systemctl hibernate";
    hibernate = "/bin/notify-send -u critical '系统暂不支持休眠(hibernate)!'";
    suspend = "/bin/systemctl suspend";
  };
  misc = {
    dropdown-terminal = "${localpkgs.dropdown-terminal}/bin/wme-dropdown-terminal";
  };
  pkgs = {
    wl-active-window = localpkgs.wl-active-window;
  };
}
