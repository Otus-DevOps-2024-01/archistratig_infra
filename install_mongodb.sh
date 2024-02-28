#!/bin/bash
sudo apt update
sudo apt install -y software-properties-common gnupg apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt update; sudo apt-get install -y mongodb-org
if [ $? -eq 0 ]; then
echo "MongoDB was installed" >> /tmp/log_deploy.log; sudo systemctl start mongod
else echo "WARN: MongoDB wasn't installed" >> /tmp/log_deploy.log exit 1; fi
exit 0;
