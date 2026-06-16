#!/bin/bash

# BUG: 未能获取到窗口的全局坐标.
niri msg --json focused-window | jq -r '.layout | "\(.window_offset_in_tile|map(floor)|join(",")) \(.window_size|"\(.[0])x\(.[1])")"'
