#!/bin/bash
sudo apt update
sudo apt install -y software-properties-common gnupg apt-transport-https ca-certificates -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update && sudo apt-get install -y mongodb-org
systemctl start mongod && systemctl enable --now mongod
