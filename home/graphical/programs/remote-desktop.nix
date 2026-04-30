{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 远程桌面工具
  home.packages =
    with pkgs;
    [
      # tigervnc
      moonlight-qt
    ]
    ++ lib.optional (customize.graphics.window == "hyprland") sunshine;

  # wayland vnc
  # BUG: Fetal error while capturing. Exiting...
  services.wayvnc = lib.mkIf (customize.graphics.window == "hyprland") {
    enable = true;
    autoStart = true;
    settings = {
      address = "0.0.0.0";
      port = 5900;
    };
  };
  # https://app.lizardbyte.dev/Sunshine/?lng=zh-CN
  systemd.user.services = {
    sunshine = lib.mkIf (customize.graphics.window == "hyprland") {
      Unit = {
        Description = "Sunshine Game Stream Server";
        StartLimitIntervalSec = 500;
        StartLimitBurst = 5;
        After = [
          "graphical-session.target"
          "xdg-desktop-autostart.target"
          "xdg-desktop-portal.service"
        ];
        PartOf = [ "graphical-session.target" ];
      };

      Service = {
        ExecStartPre = "/bin/sleep 5"; # 延迟 5 秒启动

        # 注意：这里的变量需要根据你实际的 Sunshine 路径或脚本进行替换
        ExecStart = "${pkgs.sunshine}/bin/sunshine";
        ExecStop = "pkill sunshine";
        Restart = "on-failure";
        RestartSec = "5s";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
        Alias = "sunshine.service";
      };
    };
  };
}
