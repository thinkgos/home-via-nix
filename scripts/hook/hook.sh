#!/bin/bash

scriptDir=$(
    cd $(dirname $0)
    pwd
) # 脚本路径

source $scriptDir/perf.sh
source $scriptDir/swayosd.sh
source $scriptDir/flathub.sh
