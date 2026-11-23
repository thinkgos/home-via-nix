{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#warpify

  # https://docs.warp.dev/terminal/settings/all-settings/#subshells
  subshells = {
    added_subshell_commands = [ ]; # 追加识别为子 shell 的命令正则列表 (默认: [])
    subshell_commands_denylist = [ ]; # 不触发子 shell warpification 提示的命令 (默认: [])
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#ssh
  ssh = {
    enable_ssh_warpification = true; # 是否在 SSH 会话中启用 Warp 功能 (默认: true)
    enable_legacy_ssh_wrapper = true; # 已废弃, 仅用于一次性迁移到 enable_ssh_warpification (默认: true)
    use_ssh_tmux_wrapper = false; # 已废弃, 基于 tmux 的 SSH Warpify 已移除, 仅为迁移保留 (默认: false)
    reuse_existing_control_master = false; # 旧版 SSH 封装程序是否会连接到目标主机的现有 SSH ControlMaster, 而不是总是创建自己的. (默认: false)
    ssh_extension_install_mode = "always_ask"; # 控制 SSH 扩展的安装行为 (默认: always_ask)
    ssh_hosts_denylist = [ ]; # 不应触发warpification提示的 SSH 主机
  };
}
