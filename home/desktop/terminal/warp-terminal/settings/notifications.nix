{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#notifications
  toast_duration_secs = 8; # 通知 toast 的显示时长, 单位秒 (默认: 8)
  # https://docs.warp.dev/terminal/settings/all-settings/#preferences
  preferences = {
    mode = "enabled"; # 通知总开关状态: unset/dismissed/enabled/disabled (默认: "unset")
    is_long_running_enabled = true; # 长时间运行的命令完成时是否通知 (默认: true)
    long_running_threshold = 30; # 判定长运行命令的时间阈值, 单位秒 (默认: 30)
    is_agent_task_completed_enabled = true; # Agent 任务完成时是否通知 (默认: true)
    is_needs_attention_enabled = true; # 会话需要关注时是否通知 (默认: true)
    is_password_prompt_enabled = true; # 检测到密码输入提示时是否通知 (默认: true)
    play_notification_sound = true; # 通知是否播放提示音 (默认: true)
  };
}
