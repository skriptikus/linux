#!/bin/bash
sleep 30
iostat -dkx | sed -e '1,3d' > /var/www/html/sysinfo/iosd.txt
cat /proc/net/dev | sed -e '1,2d' > /var/www/html/sysinfo/netz.txt
df | sed -e '1d' > /var/www/html/sysinfo/test.sc
mpstat | sed -e '1,3d' > /var/www/html/sysinfo/iosd2.txt
netstat -nlptu | sed -e '1,2d' > /var/www/html/sysinfo/nets.txt
df -i | sed -e '1d' > /var/www/html/sysinfo/inod.txt
netstat -ntps | head -n14 | tail -n11 > /var/www/html/sysinfo/netstattcp.txt
