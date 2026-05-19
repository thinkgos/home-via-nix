# #!/bin/bash

# #* 仅限本地测试使用
# # source $(cd "$(dirname "${BASH_SOURCE[0]}")/../lib/" && pwd)/log4sh.sh

# usage() {
#     echo "Usage: $0 [-m|--action action] [-h|--help] [path...]"
#     echo ""
#     echo "  -m, --action <action>   模式(enable|disable), 默认: enable"
#     echo "  -h, --help          显示帮助"
#     echo ""
#     echo "Example:"
#     echo "  $0 --action enable"
#     exit 1
# }

# ACTION="enable"

# PARSED=$(getopt -o m:h --long action:,help -n "$0" -- "$@")
# if [ $? -ne 0 ]; then
#     usage
# fi
# eval set -- "$PARSED"
# while true; do
#     case "$1" in
#     -m | --action)
#         ACTION="$2"
#         shift 2
#         ;;
#     -h | --help)
#         usage
#         ;;
#     --)
#         shift
#         break
#         ;;
#     *)
#         log::error "未知参数 $1"
#         usage
#         ;;
#     esac
# done

# case $ACTION in
# enable)
#     hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'
#     ;;
# disable)
#     hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'
#     ;;
# esac
