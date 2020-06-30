useradd infraboy
echo 'infraboy:infraboy' | chpasswd
useradd pmdefinitivo10x
echo 'pmdefinitivo10x:pmdefinitivo10x' | chpasswd
useradd scrum-maca
echo 'scrum-maca:scrum-maca' | chpasswd
useradd p-ro
echo 'p-ro:p-ro' | chpasswd
useradd matiester
echo 'matiester:matiester' | chpasswd
echo 'ec2-user:.PAssword22' | chpasswd
echo "AllowUsers ec2-user infraboy pmdefinitivo10x scrum-maca p-ro matiester" >> /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/#PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/#PermitTTY yes/PermitTTY yes/g' /etc/ssh/sshd_config
systemctl restart sshd

