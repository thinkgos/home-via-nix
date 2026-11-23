{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#warpify
  #
  # https://docs.warp.dev/terminal/settings/all-settings/#ssh
  ssh = {
    enable_ssh_warpification = true; # 是否在 SSH 会话中启用 Warp 功能 (默认: true)
    use_ssh_tmux_wrapper = false; # 已废弃, 基于 tmux 的 SSH Warpify 已移除, 仅为迁移保留 (默认: false)
    enable_legacy_ssh_wrapper = true; # 已废弃, 仅用于一次性迁移到 enable_ssh_warpification (默认: true)
    reuse_existing_control_master = false; # 旧版 SSH 包装器是否复用已有 SSH ControlMaster (默认: false)
    ssh_extension_install_mode = "always_ask"; # SSH 扩展安装行为: always_ask/always_install/never_install (默认: "always_ask")
    ssh_hosts_denylist = [ ]; # 不触发 warpification 提示的 SSH 主机 (默认: [])
    ssh_tmux_deprecation_notice_pending = false; # tmux 弃用提示是否待展示(内部迁移标记)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#subshells
  subshells = {
    added_subshell_commands = [ ]; # 追加识别为子 shell 的命令正则列表 (默认: [])
    subshell_commands_denylist = [ ]; # 不触发子 shell warpification 提示的命令 (默认: [])
  };
}
