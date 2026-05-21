#!/bin/bash

_CLR_RESET="\033[0m"
_CLR_TIME="\033[0;90m"  # 暗灰 — 时间戳
_CLR_DEBUG="\033[0;36m" # 青色
_CLR_INFO="\033[0;32m"  # 绿色
_CLR_WARN="\033[0;33m"  # 橙黄
_CLR_ERROR="\033[0;31m" # 红色
_CLR_FATAL="\033[1;35m" # 洋红 + 粗体

_CLR_MSG_DEBUG="\033[0;90m" # 暗灰 — debug 消息降噪
_CLR_MSG_INFO="\033[0m"     # 默认白 — info 消息
_CLR_MSG_WARN="\033[0;33m"  # 橙黄 — warn 消息
_CLR_MSG_ERROR="\033[0;31m" # 红色 — error 消息
_CLR_MSG_FATAL="\033[1;35m" # 洋红粗体 — fatal 消息

# 日志级别: DEBUG(0) INFO(1) WARN(2) ERROR(3) FATAL(4)
_LOG_LEVEL="${LOG_LEVEL:-2}"
_LOG_LEVEL_NAMES=(DEBUG INFO WARN ERROR FATAL)

_log() {
    local level=$1
    local clr_level=$2
    local clr_msg=$3
    local msg=$4
    local timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo -e "${_CLR_TIME}[${timestamp}]${_CLR_RESET} ${clr_level}[${level}]${_CLR_RESET} ${clr_msg}${msg}${_CLR_RESET}" >&2
}

log::set_level() {
    local level="$1"
    case "$level" in
    DEBUG | INFO | WARN | ERROR | FATAL)
        _LOG_LEVEL=$(for i in "${!_LOG_LEVEL_NAMES[@]}"; do
            [[ "${_LOG_LEVEL_NAMES[$i]}" == "$level" ]] && echo "$i" && break
        done)
        ;;
    [0-4])
        _LOG_LEVEL="$level"
        ;;
    *)
        _log "WARN" "$_CLR_WARN" "$_CLR_MSG_WARN" "无效的日志级别: $level (支持: DEBUG|INFO|WARN|ERROR|FATAL|0-4)"
        ;;
    esac
}

log::debug() { [[ $_LOG_LEVEL -le 0 ]] && _log "DEBUG" "$_CLR_DEBUG" "$_CLR_MSG_DEBUG" "$*" || true; }
log::info() { [[ $_LOG_LEVEL -le 1 ]] && _log "INFO " "$_CLR_INFO" "$_CLR_MSG_INFO" "$*" || true; }
log::warn() { [[ $_LOG_LEVEL -le 2 ]] && _log "WARN " "$_CLR_WARN" "$_CLR_MSG_WARN" "$*" || true; }
log::error() { [[ $_LOG_LEVEL -le 3 ]] && _log "ERROR" "$_CLR_ERROR" "$_CLR_MSG_ERROR" "$*" || true; }
log::fatal() { [[ $_LOG_LEVEL -le 4 ]] && _log "FATAL" "$_CLR_FATAL" "$_CLR_MSG_FATAL" "$*" || true; }
