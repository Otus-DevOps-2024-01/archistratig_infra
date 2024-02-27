#!/bin/bash
sudo apt update
sudo apt install -y software-properties-common gnupg apt-transport-https ca-certificates -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update && sudo apt-get install -y mongodb-org
sudo mkdir -p /data/db
sudo chown -R `id -u` /data/db
sudo chmod -R go+w /data/db
sudo touch /data/db/mongod.lock
sudo chmod 0777 /data/db/mongd.lock
sudo systemctl start mongod && systemctl enable --now mongod


