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
    use_ssh_tmux_wrapper = false; # 已废弃, 基于 tmux 的 SSH Warpify 已移除, 仅为迁移保留 (默认: false)
    enable_legacy_ssh_wrapper = true; # 已废弃, 仅用于一次性迁移到 enable_ssh_warpification (默认: true)
    ssh_tmux_deprecation_notice_pending = false; # tmux 弃用提示是否待展示(内部迁移标记)
  };
  # https://docs.warp.dev/terminal/settings/all-settings/#subshells
  subshells = {
    added_subshell_commands = [ ]; # 追加识别为子 shell 的命令正则列表 (默认: [])
  };
}
