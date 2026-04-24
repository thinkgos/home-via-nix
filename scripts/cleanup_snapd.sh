#!/bin/bash

sudo apt autoremove -y --purge snapd

echo -e "Package: snapd\nPin: release a=*\nPin-Priority: -10" | sudo tee /etc/apt/preferences.d/nosnap.pref
