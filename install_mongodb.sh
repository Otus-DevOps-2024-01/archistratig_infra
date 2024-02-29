#!/bin/bash
sudo apt install -y software-properties-common gnupg curl apt-transport-https ca-certificate
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 656408E390CFB1F5
echo "deb [arch=amd64] http://repo.mongodb.org/apt/ubuntu $(lsb_release -sc)/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl daemon-reload
sudo systemctl enable mongod.service
systemctl start mongod.service
systemctl status mongod.service
sudo systemctl --type=service --state=active | grep mongod
