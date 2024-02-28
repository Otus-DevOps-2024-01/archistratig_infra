#!/bin/bash
sudo apt-get install dbus -y
sudo apt-get install --reinstall dbus
systemctl start dbus
sudo apt install --reinstall libpam-systemd -y
sudo systemctl start dbus
sudo apt-get install dbus-daemon
dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
ps aux
/etc/init.d/dbus start
sudo systemctl list-units --type=service
sudo apt install -y software-properties-common gnupg curl apt-transport-https ca-certificates
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - && \
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
sudo apt-get update && sudo apt-get install -y mongodb-org
systemctl start mongod && systemctl enable mongod
