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
/etc/init.d/dbus start
sudo systemctl list-units --type=service
sudo apt install -y software-properties-common gnupg curl apt-transport-https ca-certificates
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add - && \
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
sudo apt-get update && sudo apt-get install -y mongodb-org
sudo systemctl start mongod.service && sudo systemctl enable mongod.service&& sudo systemctl status mongod.service
cat /var/lib/mongodb/mongodb.log
sudo nano /var/log/mongodb/mongod.log | grep "ERROR: child process failed, exited with error number 1"
