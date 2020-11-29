#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Usage: ./webserver <dir>"
  exit -1
fi

DIR= pwd $1
sed -i "s/%%WORKING_DIR%%/$DIR/g" ./resources/benito.service

apt-get update
apt-get -y install -y openjdk-8-jdk
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get -y install -y nodejs
apt install -y npm
npm i -g npm

git clone https://github.com/proyeception/benito ../

mkdir /var/log
mkdir /var/log/benito

cp ./resources/application.conf ../benito/benito-backend/environments/prod/
cp ./resources/sensitive.conf ../benito/benito-backend/src/main/resources
cp ./resources/benito.service /lib/systemd/system/

cd ../benito

bash build prod

systemctl start benito
systemctl enable benito