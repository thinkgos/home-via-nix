#!/bin/bash

HOOKS_DIR=$(dirname "${BASH_SOURCE[0]}") # 脚本路径

source $HOOKS_DIR/perf.sh
source $HOOKS_DIR/swayosd.sh
source $HOOKS_DIR/flathub.sh
