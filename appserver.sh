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

git clone https://github.com/proyeception/pitonisio
git clone https://github.com/proyeception/medusa

cd pitonisio
CFLAGS="-Wno-narrowing" pip3 install cld2-cffi
pip3 install -r requirements.txt

cd ../medusa
npm i

DATABASE_USERNAME=medusa
DATABASE_PASSWORD=pasguord
DATABASE_SRV=false
DATABASE_HOST=10.116.0.4
DATABASE_PORT=27017
DATABASE_NAME=proyectate
SUPERVISOR_LOGIN_URL=http://localhost:8080/supervisor/login
AUTHORIZATION_TOKENS=["CpZX0UuC3n?XZ!IGv36VBQbD1H#r&pVMD*UdaGZxdGM!PTqDPX"]