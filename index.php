<?php
echo "Content-Type: text/html";
echo "";
echo "";
echo "</html>";
echo "<head><META HTTP-EQUIV='REFRESH' CONTENT='5'></head>";
echo "<b><hr><b>NGINX Version: $HTTP_X_NGX_VERSION</b><hr><pre>Nginx side: $remote_addr:$remote_port</pre>";
echo system('/var/www/html/sysinfo/track.sh');
echo "Загрузка дисков";
echo "<br />";
//system('iostat -dkx | sed -e \'1,3d\' > /var/www/html/sysinfo/iosd.txt');
echo system('/var/www/html/sysinfo/iostat2.sh');
echo "<br />";
echo "Загрузка сети";
echo "<br />";
system('/var/www/html/sysinfo/zagrnet.sh');
echo "<br />";
echo "Информация о дисках";
system('/var/www/html/sysinfo/test43.sh');
system('/var/www/html/sysinfo/test44.sh');
echo "<br />";
echo "Загрузка CPU";
echo "<br />";
//system(' mpstat | sed -e \'1,3d\' > /var/www/html/sysinfo/iosd2.txt');
system('/var/www/html/sysinfo/zagrcpu.sh');
echo "<br />";
echo "<br />";
echo "информация о сетевых соединениях";
echo "<br />";
//system('netstat -nlptu | sed -e \'1,2d\' > /var/www/html/sysinfo/nets.txt');
system('/var/www/html/sysinfo/infnetconnection.sh');
system('/var/www/html/sysinfo/netstattcp.sh');
echo "<br />";
//echo "Загрузка CPU";
//system('/var/www/html/zagrcpu2.sh');
echo "</body>";
echo "</html>";
?>

