{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.wlogout = {
    enable = true;
    # BUG: 这里注销导致hyprland起不来(但是快捷键里注销时面正常时而不正常).
    layout = [
      {
        label = "lock";
        action = "blast-lock-screen";
        text = "锁屏 (L)";
        keybind = "l";
      }
      {
        label = "logout";
        # action = "hyprctl dispatch exit";
        action = "hyprctl dispatch exec \"hyprshutdown\"";
        # action = "notify-send '注销有BUG!'";
        text = "注销 (E)";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "关机 (S)";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "重启 (R)";
        keybind = "r";
      }
      {
        # 休眠是写到swap文件(swap空间必须大于内存), 需要主板与BIOS/UEFI支持(主板必须支持ACPI S4状态)
        label = "hibernate";
        # action = "systemctl hibernate";
        action = "notify-send '系统暂不支持休眠(hibernate)!'";
        text = "休眠 (H)";
        keybind = "h";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "挂起 (U)";
        keybind = "u";
      }
    ];
    style = ''
      * {
          background-image: none;
          box-shadow: none;
      }

      window {
          background-color: rgba(30, 30, 46, 0.9); /* Mocha Crust/Base with transparency */
      }

      button {
          color: #cdd6f4;           /* Mocha Text */
          background-color: #313244; /* Mocha Surface0 */
          border: 2px solid #89b4fa; /* Mocha Blue */
          border-radius: 20px;
          
          margin: 50px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;      /* 调整这个百分比来缩小图标 */
          min-width: 100px;          /* 限制按钮最小宽度 */
          min-height: 100px;         /* 限制按钮最小高度 */
          transition: background-color 0.2s ease-in-out, border-color 0.2s ease-in-out;
      }

      button:focus, button:active, button:hover {
          background-color: #45475a; /* Mocha Surface1 */
          border-color: #f5c2e7;     /* Mocha Pink */
          outline-style: none;
      }

      /* 图标路径引用 */
      #lock { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png")); }
      #logout { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png")); }
      #suspend { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png")); }
      #hibernate { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png")); }
      #shutdown { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png")); }
      #reboot { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png")); }
    '';
  };
}
