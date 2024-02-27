#!/bin/bash
sudo apt-get install dbus -y
sudo apt install -y software-properties-common gnupg apt-transport-https ca-certificates -y
sudo apt update
sudo apt install -y apt-utils
sudo mkdir -p /data/db
sudo chmod 777 /data/db
sudo mkdir -p /home/mongodb
sudo chmod 777 /home/mongodb
sudo chown root:root /tmp
sudo chmod 1777 /tmp
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update && sudo apt-get install -y mongodb-org && sudo systemctl unmask mongod
sudo systemctl enable mongod.service
sudo systemctl start mongod && sudo service mongodb start &&  sudo systemctl enable mongod
mongo
