tee -a /etc/yum.repos.d/mongodb.repo > /dev/null <<EOT
[MongoDB]
name=MongoDB Repository
baseurl=http://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc
EOT

yum -y install mongodb-org
systemctl start mongod.service
systemctl enable mongod.service
