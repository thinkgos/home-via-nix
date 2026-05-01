#!/bin/bash

echo "󰘚 $(lspci | grep "VGA" | sed -n 's/.*\[\([^]]*\)\].*/\1/p')"