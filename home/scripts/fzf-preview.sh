#!/bin/bash

#* 仅限本地测试使用
# source $(cd "$(dirname "${BASH_SOURCE[0]}")/../lib/" && pwd)/log4sh.sh

usage() {
    echo "Usage: $0 [-m|--mode mode] [-h|--help] [path...]"
    echo ""
    echo "  -m, --mode <mode>   模式(walker|preview|content), 默认: preview"
    echo "  -h, --help          显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 -m preview path1 path2"
    echo "  $0 --mode walker /path/to/search"
    exit 1
}

MODE="preview"

PARSED=$(getopt -o m:h --long mode:,help -n "$0" -- "$@")
if [ $? -ne 0 ]; then
    usage
fi
eval set -- "$PARSED"
while true; do
    case "$1" in
    -m | --mode)
        MODE="$2"
        shift 2
        ;;
    -h | --help)
        usage
        ;;
    --)
        shift
        break
        ;;
    *)
        log::error "未知参数 $1"
        usage
        ;;
    esac
done
PATHS=("$@")

case $MODE in
walker)
    # 指定路径搜索
    fd . "${PATHS[@]}" | fzf
    ;;
preview)
    # 指定路径搜索, 并bat预览文件内容
    # 回车vim编辑
    # ctrl+o开新窗口进行vim编辑
    # ctrl+y复制文件内容到剪贴板
    fd . --type file "${PATHS[@]}" | fzf \
        --preview "bat --style=plain --color=always {}" \
        --bind "enter:become(vim {-1})" \
        --bind "ctrl-o:execute:vim {-1}" \
        --bind "ctrl-y:execute-silent(cat {-1} | wl-copy)"
    ;;
content)
    # 指定路径对文件内容采用rg搜索, 并bat进行预览文件内容
    # 回车vim编辑
    # ctrl+o开新窗口进行vim编辑
    # ctrl+y复制文件内容到剪贴板
    RELOAD="reload:rg --column --color=always --smart-case {q} ${PATHS[@]} || :"
    fzf \
        --disabled \
        --ansi \
        --bind "start:$RELOAD" \
        --bind "change:$RELOAD" \
        --bind "enter:become:vim {1} +{2}" \
        --bind "ctrl-o:execute:vim {1} +{2}" \
        --bind "ctrl-y:execute-silent(cat {1} | wl-copy)" \
        --delimiter : \
        --preview "bat --style=plain --color=always --highlight-line {2} {1}" \
        --preview-window "~4,+{2}+4/3,<80(up)"
    ;;
*)
    log::error "不支持的模式 -$MODE"
    usage
    ;;
esac
