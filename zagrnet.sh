#!/bin/bash
k=$(wc -l /var/www/html/sysinfo/netz.txt | awk '{print $1}')
count=0
echo "<body>"
echo "<table><th>interface</th><th>bytes</th><th>packets</th><th>errs</th><th>drop</th><th>fifo</th><th>frame</th><th>compressed</th><th>multicast</th><th>bytes</th><th>packets</th><th>errs</th><th>drop</th><th>fifo</th><th>colls</th><th>careir</th><th>compressed</th>"
while [ $count -lt $k ]
do
count=$(( $count + 1 ))
echo "<tr>"
cat  /var/www/html/sysinfo/netz.txt | head -n$count | tail -n1| awk '{ for(i=1; i<18; i++){ print ("<td>" $i "</td>")}}'
echo "</tr>"
done;
echo "</tr>"
echo "</table>"
echo "</body>"
echo "<br />"



