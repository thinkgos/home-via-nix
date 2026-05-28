#!/bin/bash

# 仅本地测试使用
# source "$(cd "$(dirname "${BASH_SOURCE[0]}")/../../ohlib/shell" && pwd)/log4sh.sh"

declare -A actions
declare -a labels

add_item() {
    labels+=("$1")
    actions["$1"]="$2"
}

add_item "🗒️ Clipboard History Overview" "vicinae vicinae://launch/clipboard/history"
add_item "🧹 Clipboard History Wipe" "vicinae vicinae://launch/clipboard/clear-history"
add_item "😀 Search Emoji" "vicinae vicinae://launch/core/search-emojis"
add_item "🪟 Window Overview" "vicinae vicinae://launch/wm/switch-windows"
add_item "🖼️ Wallpaper Picker" "hvn-picker-wallpaper -m normal"
add_item "🖼️ Wallpaper Picker Side" "hvn-picker-wallpaper -m side"

chosen=$(printf '%s\n' "${labels[@]}" | rofi -dmenu -no-show-icons -width 10 -p "Select:" -config "$HOME/.config/rofi/config-shortcut.rasi")

if [[ -n "$chosen" ]]; then
    # log::debug "chosen: $chosen"
    eval "${actions[$chosen]}"
fi
