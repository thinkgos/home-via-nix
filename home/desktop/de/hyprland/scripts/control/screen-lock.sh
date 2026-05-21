#!/bin/bash

# 锁屏并关闭屏幕
hyprlock &
/bin/sleep 1 && hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'
