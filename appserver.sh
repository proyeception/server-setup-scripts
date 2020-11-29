#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Usage: ./appserver <dir>"
  exit -1
fi

DIR= pwd $1
sed -i "s/%%WORKING_DIR%%/$DIR/g" ./resources/medusa.service
sed -i "s/%%WORKING_DIR%%/$DIR/g" ./resources/pitonisio.service

apt-get update
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get -y install -y nodejs
apt install -y npm
npm i -g npm
apt install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y python3.8
apt install -y python3-pip
apt-get install libc6-dev

git clone https://github.com/proyeception/pitonisio ../
git clone https://github.com/proyeception/medusa ../

cd ../pitonisio
CFLAGS="-Wno-narrowing" pip3 install cld2-cffi
pip3 install -r requirements.txt

cd ../medusa
npm i

mkdir /var/log
mkdir /var/log/medusa
mkdir /var/log/pitonisio

cp ./resources/medusa.service /lib/systemd/system
cp ./resources/pitonisio.service /lib/systemd/system

systemctl start pitonisio
systemctl start medusa
systemctl enable pitonisio
systemctl enable medusa