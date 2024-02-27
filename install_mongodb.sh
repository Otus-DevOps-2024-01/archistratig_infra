#!/bin/bash
sudo apt-get install dbus -y
sudo apt install -y software-properties-common gnupg apt-transport-https ca-certificates -y
sudo apt update
sudo apt install -y apt-utils
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update -y && sudo apt-get install -y mongodb-org && sudo systemctl unmask mongod
sudo systemctl status mongod.service &&  sudo systemctl enable mongod
dpkg -l | grep mongodb
sudo journalctl -eu mongodb.service
