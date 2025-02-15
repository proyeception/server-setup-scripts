#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Usage: ./webserver <dir>"
  exit -1
fi

CURRENT_DIR=$PWD
TARGET_DIR=$1;
cd $TARGET_DIR
TARGET_DIR=$PWD
cd $CURRENT_DIR

sed -i "s|%%WORKING_DIR%%|$TARGET_DIR|g" ./resources/benito.service

apt-get update
apt-get -y install -y openjdk-8-jdk
apt-get -y install maven
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get -y install -y nodejs
apt install -y npm
npm i -g npm

git clone https://github.com/proyeception/benito $TARGET_DIR/benito

mkdir /var/log
mkdir /var/log/benito

cp ./resources/application.conf $TARGET_DIR/benito/benito-backend/environments/prod/
cp ./resources/sensitive.conf $TARGET_DIR/benito/benito-backend/src/main/resources
cp ./resources/config.ts $TARGET_DIR/benito/benito-frontend/environments/prod/
cp ./resources/benito.service /lib/systemd/system/

cd $TARGET_DIR

bash benito/build prod

systemctl start benito
systemctl enable benito