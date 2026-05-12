#!/bin/bash

MODE="preview"

usage() {
    echo "Usage: $0 [-m mode] [-e editor] [-v] [-h] [target]"
    echo ""
    echo "  -m mode     模式(walker|preview|content), 默认: preview"
    echo "  -h          显示帮助"
    exit 1
}

while getopts ":m:h" opt; do
    case $opt in
    m)
        MODE=$OPTARG
        ;;
    h)
        usage
        ;;
    :)
        echo "error: -$OPTARG 需要一个值" >&2
        usage
        ;;
    \?)
        echo "error: 未知参数 -$OPTARG" >&2
        usage
        ;;
    esac
done

shift $((OPTIND - 1))
TARGET=("$@")

case $MODE in
walker)
    # 指定路径搜索
    fd . $TARGET | fzf
    ;;
preview)
    # 指定路径搜索, 并bat预览文件内容
    # 回车vim编辑
    # ctrl+o开新窗口进行vim编辑
    # ctrl+y复制文件内容到剪贴板
    fd . --type file $TARGET | fzf \
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
    RELOAD="reload:rg --column --color=always --smart-case {q} $TARGET || :"
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
\?)
    echo "error: 不支持的模式 -$MODE" >&2
    usage
    ;;
esac
