#!/bin/bash
sudo apt-get install dbus -y
sudo apt-get install --reinstall dbus
systemctl start dbus
sudo apt install --reinstall libpam-systemd -y
sudo apt install nano -y
sudo systemctl start dbus
sudo apt-get install dbus-daemon
dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
ps aux
sudo mkdir -p /data/db
sudo chown -R `id -u` /data/db
sudo chmod -R go+w /data/db
sudo mkdir -p /var/run/dbus
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
sudo systemctl list-units --type=service
sudo apt install -y software-properties-common gnupg curl apt-transport-https ca-certificates
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add - && \
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl daemon-reload
sudo systemctl enable mongod.service
systemctl start mongod.service
systemctl status mongod.service
sudo systemctl --type=service --state=active | grep mongod
