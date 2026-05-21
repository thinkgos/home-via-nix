#!/bin/bash

scriptDir=$(
    cd $(dirname $0)
    pwd
) # 脚本路径

source $scriptDir/systemd/swayosd.sh
