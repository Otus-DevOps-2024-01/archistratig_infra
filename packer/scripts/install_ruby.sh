#!/bin/sh
killall apt apt-get
rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock*
dpkg --configure -a
apt update
apt install -y ruby-full ruby-bundler build-essential
