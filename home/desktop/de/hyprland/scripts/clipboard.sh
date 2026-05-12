#!/bin/bash

mode="$1"

case "$mode" in
history-overview)
    cliphist list | fuzzel --dmenu --anchor top-right --x-margin=220 --y-margin=0 --width 60 --mesg "📋 剪贴板" | cliphist decode | wl-copy
    ;;
history-wipe)
    cliphist wipe
    ;;
esac

exit 0
