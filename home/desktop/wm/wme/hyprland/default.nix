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
    lock = "${localpkgs.screen-lock}/bin/wme-screen-lock";
    # BUG: 这里注销导致hyprland起不来(但是快捷键里注销时面正常时而不正常).
    # logout = "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.exit()'";
    # logout = ''${pkgs.hyprland}/bin/hyprctl dispatch  'hl.dsp.exec_cmd("hyprshutdown")'';
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
    screenshot = "${localpkgs.screenshot}/bin/wme-screenshot";
    interactive-power = "${localpkgs.power}/bin/wme-power";
    focus-last-workspace = "${localpkgs.focus-last-workspace}/bin/wme-focus-last-workspace";
  };
}
