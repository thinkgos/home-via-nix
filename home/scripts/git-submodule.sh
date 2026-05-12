#!/bin/bash

MODE="raw"
BRANCH=""
COMMAND=""
PARALLEL=true

git-submodule-command() {
    local command=$1
    if [[ -z $command ]]; then
        echo "error: 请指定命令"
        return 1
    fi
    if [[ $PARALLEL == true ]]; then
        git submodule foreach --quiet --recursive 'echo $path' | parallel -j 8 "cd {} && echo '进入 {}' && $command"
    else
        git submodule foreach --quiet --recursive "$command"
    fi
}

usage() {
    echo "Usage: $0 [-m mode] [-b branch] [-c command] [-n] [-h]"
    echo ""
    echo "  -m mode     模式(raw|switch-branch|check-branch|fetch-origin), 默认: raw"
    echo "  -b branch   分支"
    echo "  -c command  命令, raw模式下必填"
    echo "  -n          非并发执行, 默认并发"
    echo "  -h          显示帮助"
    exit 1
}

while getopts ":m:bcnh" opt; do
    case $opt in
    m)
        MODE=$OPTARG
        ;;
    b)
        BRANCH=$OPTARG
        ;;
    c)
        COMMAND=$OPTARG
        ;;
    n)
        PARALLEL=false
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
raw)
    git-submodule-command $COMMAND
    ;;
pull-rebase)
    git-submodule-command "git pull --rebase"
    ;;
switch-branch)
    if [[ -z $BRANCH ]]; then
        echo "error: 请指定分支"
        exit 1
    fi
    git-submodule-command "git checkout ${BRANCH}"
    ;;
check-branch)
    if [[ -z $BRANCH ]]; then
        echo "error: 请指定分支"
        exit 1
    fi
    git-submodule-command "git checkout -b ${BRANCH} origin/${BRANCH}"
    ;;
fetch-origin)
    if [[ -z $BRANCH ]]; then
        echo "error: 请指定分支"
        exit 1
    fi
    git-submodule-command "git fetch origin ${BRANCH}:${BRANCH}"
    ;;
esac
