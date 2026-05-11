#!/bin/bash

mode="$1"

case "$mode" in
history-overview)
    cliphist list | wofi --dmenu | cliphist decode | wl-copy
    ;;
history-wipe)
    cliphist wipe
    ;;
esac

exit 0
