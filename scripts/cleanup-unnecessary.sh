#!/bin/bash

echo "清理不需要的软件..."
sudo apt autoremove -y --purge snapd cloud-init open-iscsi apport modemmanager unattended-upgrades rsyslog needrestart

echo "清理不需要的服务端服务..."
sudo systemctl disable --now multipathd
sudo systemctl mask multipathd
sudo systemctl disable --now lvm2-monitor.service lvm2-lvmpolld.socket
sudo systemctl mask lvm2-monitor.service lvm2-lvmpolld.socket
sudo systemctl disable --now apport.service
sudo systemctl mask apport.service
sudo systemctl disable --now ModemManager.service
sudo systemctl mask ModemManager.service
sudo systemctl disable --now systemd-networkd.service systemd-networkd.socket networkd-dispatcher.service systemd-networkd-varlink.socket systemd-networkd-resolve-hook.socket
sudo systemctl mask systemd-networkd.service systemd-networkd.socket networkd-dispatcher.service systemd-networkd-varlink.socket systemd-networkd-resolve-hook.socket

sudo rm -rf /etc/cloud/ /var/lib/cloud/

echo -e "Package: snapd\nPin: release a=*\nPin-Priority: -10" | sudo tee /etc/apt/preferences.d/nosnap.pref
