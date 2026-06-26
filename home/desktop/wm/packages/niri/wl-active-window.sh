#!/bin/bash

# 活动窗口
FOCUSED_WINDOW=$(niri msg --json focused-window)
WORKSPACE_ID=$(echo "$FOCUSED_WINDOW" | jq '.workspace_id')

# 活动窗口所在工作区
FOCUSED_WORKSPACE=$(niri msg --json workspaces | jq -r ".[] | select(.id == $WORKSPACE_ID)")

# 工作区所在显示器
FOCUSED_OUTPUT=$(niri msg --json focused-output)

# BUG: 未能获取到窗口的相对坐标.
# VIEW_X=$(echo "$FOCUSED_WINDOW" | jq ".layout.tile_pos_in_workspace_view[0]")
# VIEW_Y=$(echo "$FOCUSED_WINDOW" | jq ".layout.tile_pos_in_workspace_view[1]")
# echo $VIEW_X
# echo $VIEW_Y

OUTPUT_X=$(echo "$FOCUSED_OUTPUT" | jq '.logical.x')
OUTPUT_Y=$(echo "$FOCUSED_OUTPUT" | jq '.logical.y')

WINDOW_SIZE=$(echo "$FOCUSED_WINDOW" | jq -r '.layout.window_size | "\(.[0])x\(.[1])"')

echo "workspace_id" $WORKSPACE_ID
echo "window_size" $WINDOW_SIZE
echo "output_x" $OUTPUT_X
echo "output_y" $OUTPUT_Y
