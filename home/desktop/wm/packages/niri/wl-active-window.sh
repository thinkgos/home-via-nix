#!/bin/bash

niri msg focused-window --json | jq -r '"\(.x),\(.y) \(.width)x\(.height)"'
