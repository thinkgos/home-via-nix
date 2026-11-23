{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#warp-drive
  enabled = true; # 是否启用 Warp Drive (默认: true)
  sorting_choice = "by_object_type"; # Warp Drive 项目的排序方式: by_timestamp/alphabetical_descending/alphabetical_ascending/by_object_type (默认: "by_object_type")
}
