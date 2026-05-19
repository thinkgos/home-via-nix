#!/bin/bash

#* 仅限本地测试使用
# source $(cd "$(dirname "${BASH_SOURCE[0]}")/../lib/" && pwd)/log4sh.sh

usage() {
    echo "Usage: $0 [-m|--mode mode] [-b|--branch branch] [-c|--command command] [-n|--no-parallel] [-h|--help]"
    echo ""
    echo "  -m, --mode <mode>       模式(raw|pull-rebase|switch-branch|checkout-branch|fetch-origin), 默认: raw"
    echo "  -b, --branch <branch>   分支"
    echo "  -c, --command <command> 命令, raw模式下必填"
    echo "  -n, --no-parallel       非并发执行, 默认并发"
    echo "  -h, --help              显示帮助"
    exit 1
}

MODE="raw"
BRANCH=""
COMMAND=""
PARALLEL=true

git-submodule-command() {
    local command=$1
    if [[ -z $command ]]; then
        log::error "请指定命令"
        return 1
    fi
    if [[ $PARALLEL == true ]]; then
        # shellcheck disable=SC2016
        git submodule foreach --quiet --recursive 'echo $path' |
            parallel -j 8 --keep-order "cd {} && echo '进入 {}' && $command"
    else
        git submodule foreach --quiet --recursive "$command"
    fi
}

PARSED=$(getopt -o m:b:c:nh --long mode:,branch:,command:,no-parallel,help -n "$0" -- "$@")
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
    -b | --branch)
        BRANCH="$2"
        shift 2
        ;;
    -c | --command)
        COMMAND="$2"
        shift 2
        ;;
    -n | --no-parallel)
        PARALLEL=false
        shift
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

case $MODE in
raw)
    # 递归子模块执行命令
    git-submodule-command "$COMMAND"
    ;;
pull-rebase)
    # 递归子模块 git pull rebase
    git-submodule-command "git pull --rebase"
    ;;
switch-branch)
    if [[ -z $BRANCH ]]; then
        log::error "请指定分支"
        exit 1
    fi
    # 递归子模块 git checkout ${branch}
    git-submodule-command "git checkout ${BRANCH}"
    ;;
checkout-branch)
    if [[ -z $BRANCH ]]; then
        log::error "请指定分支"
        exit 1
    fi
    # 递归子模块 git checkout -b ${branch} origin/${branch}
    git-submodule-command "git checkout -b ${BRANCH} origin/${BRANCH}"
    ;;
fetch-origin)
    if [[ -z $BRANCH ]]; then
        log::error "请指定分支"
        exit 1
    fi
    # 递归子模块 git fetch origin ${branch}:${branch}
    git-submodule-command "git fetch origin ${BRANCH}:${BRANCH}"
    ;;
esac
