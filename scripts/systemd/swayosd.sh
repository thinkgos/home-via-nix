#!/bin/bash

# 配合swayosd的swayosd-libinput-backend systemd服务
# 需要dbus规则

sudo tee /usr/lib/systemd/system/swayosd-libinput-backend.service >/dev/null <<EOF
[Unit]
Description=SwayOSD LibInput backend for listening to certain keys like CapsLock, ScrollLock, VolumeUp, etc...
Documentation=https://github.com/ErikReider/SwayOSD
PartOf=graphical.target
After=graphical.target

[Service]
Type=dbus
BusName=org.erikreider.swayosd
ExecStart=/home/$USER/.nix-profile/bin/swayosd-libinput-backend
Restart=on-failure

[Install]
WantedBy=graphical.target
EOF

# 配置swayosd的dbus规则
sudo tee /usr/share/dbus-1/system.d/org.erikreider.swayosd.conf >/dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?> <!-- -*- XML -*- -->
<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN" "https://specifications.freedesktop.org/dbus/introspect-latest.dtd">
<busconfig>
  <!-- Only root can own the service -->
  <policy user="root">
    <allow own="org.erikreider.swayosd" />
  </policy>

  <!-- Anyone can talk to the main interface -->
  <policy context="default">
    <allow send_destination="org.erikreider.swayosd" send_interface="org.erikreider.swayosd" />
    <allow send_destination="org.erikreider.swayosd"
      send_interface="org.freedesktop.DBus.Introspectable" />
    <allow send_destination="org.erikreider.swayosd"
      send_interface="org.freedesktop.DBus.Properties" />
    <allow send_destination="org.erikreider.swayosd" send_interface="org.freedesktop.DBus.Peer" />
  </policy>
</busconfig>
EOF

# 配置swayosd的udev规则
sudo tee /etc/udev/rules.d/99-swayosd.rules >/dev/null <<EOF
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
EOF

sudo systemctl reload dbus
sudo systemctl enable swayosd-libinput-backend.service
sudo systemctl start swayosd-libinput-backend.service
