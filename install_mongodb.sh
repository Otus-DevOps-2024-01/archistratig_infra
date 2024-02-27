#!/bin/bash
sudo apt-get install apt-transport-https ca-certificates
sudo apt update
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
sudo ss -pnltu | grep 27017
sudo mongod --repair
sudo service mongod start
sudo systemctl enable mongod
