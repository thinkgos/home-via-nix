#!/bin/bash

sudo tee /etc/sysctl.d/99-swappiness.conf >/dev/null <<EOF
vm.swappiness=20
vm.vfs_cache_pressure=50
EOF

sudo sysctl --system
