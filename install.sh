#!/bin/bash

apt-get install -y bc 
apt-get install -y elinks
apt-get install -y sysstat
apt-get install nginx -y
useradd sysuser
cp default /etc/nginx/sites-available/

systemctl restart nginx

apt-get install apache2 -y
apt-get install  php7.0  -y
apt-get install libapache2-mod-php7.0 -y
cp ports.conf /etc/apache2/
cp 000-default.conf /etc/apache2/sites-available/
systemctl restart apache2
rm -rf /var/www/html/*
mkdir -p /var/www/html/sysinfo
cp index.php /var/www/html/sysinfo/ 
cp infnetconnection.sh /var/www/html/sysinfo/
cp iostat2.sh /var/www/html/sysinfo/
cp netstattcp.sh /var/www/html/sysinfo/
cp test43.sh /var/www/html/sysinfo/
cp test44.sh /var/www/html/sysinfo/
cp track.sh /var/www/html/sysinfo/
cp zagrcpu.sh /var/www/html/sysinfo/
cp zagrnet.sh /var/www/html/sysinfo/
chmod a+w *.txt
cp cron2.sh /var/www/html/sysinfo/
echo "*/1 * * * * sysuser iostat -dkx | sed -e '1,3d' > /var/www/html/sysinfo/iosd.txt" >> /etc/crontab
echo "*/1 * * * * sysuser cat /proc/net/dev | sed -e '1,2d' > /var/www/html/sysinfo/netz.txt" >> /etc/crontab
echo "*/1 * * * * sysuser df | sed -e '1d' > /var/www/html/sysinfo/test.sc" >> /etc/crontab
echo "*/1 * * * * sysuser mpstat | sed -e '1,3d' > /var/www/html/sysinfo/iosd2.txt" >> /etc/crontab
echo "*/1 * * * * sysuser netstat -nlptu | sed -e '1,2d' > /var/www/html/sysinfo/nets.txt" >> /etc/crontab
echo "*/1 * * * * sysuser df -i | sed -e '1d' > /var/www/html/sysinfo/inod.txt" >> /etc/crontab
echo "*/1 * * * * sysuser netstat -ntps | head -n14 | tail -n11 > /var/www/html/sysinfo/netstattcp.txt" >> /etc/crontab
echo "*/1 * * * * sysuser /var/www/html/sysinfo/cron2.sh " >> /etc/crontab
