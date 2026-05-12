#!/bin/bash

program="$1"
if [ -z "$program" ]; then
    exit 1
fi

systemd-run --user flatpak run $program
exit 0
