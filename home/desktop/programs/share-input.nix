{
  config,
  lib,
  pkgs,
  extra-pkgs,
  customize,
  ...
}:
let
  enableLanMouse = builtins.any (c: c == "lan-mouse-client" || c == "lan-mouse") customize.components;
in
{
  # TODO: deskflow等ISSUE合, 目前暂不支持.
  # https://github.com/deskflow/deskflow/discussions/7499
  # https://github.com/hyprwm/xdg-desktop-portal-hyprland/issues/259
  home.packages = [ ] ++ lib.optional (builtins.elem "deskflow" customize.components) pkgs.deskflow;

  # 键鼠共享
  programs.lan-mouse = {
    enable = enableLanMouse;
    systemd = builtins.elem "lan-mouse" customize.components;
    package = extra-pkgs.lan-mouse;
    # Optional configuration in nix syntax, see config.toml for available options
    # settings = { };
  };
  # 创建默认配置文件，如果不存在
  home.activation.create-lan-mouse-default-config = lib.mkIf enableLanMouse (
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      file=${config.xdg.configHome}/lan-mouse/config.toml
      if [ ! -f "$file" ]; then
        mkdir -p "$(dirname "$file")"
        touch "$file"
      fi
    ''
  );
}
