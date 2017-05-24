#!/bin/bash
pygmentize (){
if [[ $(echo "$1 > 90" | bc) -eq 1 ]]; then
OUT="<span style='color: red;'>$1</span>"
elif [[ $(echo "$1 > 70" | bc) -eq 1 ]]; then
OUT="<span style='color: yellow;'>$1</span>"
else
OUT="<span style='color: green;'>$1</span>"
fi
echo $OUT
}
echo "<body><table>"
echo "<tr><th>Device:</th><th>rrqm/s</th><th>wrqm/s</th><th>r/s</th><th>w/s</th><th>rkB/s</th><th>wkB/s</th><th>avgrq-sz"
echo "</th><th>avgqu-sz</th><th>await</th><th>r_await</th><th>w_await</th><th>svctm</th><th>%util</th></tr>"
timeout 15 iostat -dkx  > /var/www/htm/sysinfo/iosd.txt
k=$(wc -l /var/www/html/sysinfo/iosd.txt | awk '{print $1;}')
count=0
while [ $count -lt $k ]
do
count=$(( $count + 1 ))
echo "<tr>"
cat /var/www/html/sysinfo/iosd.txt | head -n$count | tail -n1 | awk '{ for(i=1; i<14; i++){ print ("<td>" $i "</td>")}}'
echo "<td>"
res=$(cat /var/www/html/sysinfo/iosd.txt | head -n$count | tail -n1 | awk '{print $14}')
pygmentize $res
echo "</td>"
echo "</tr>"
done
echo "</table>"
echo "<br />"
echo "</body>"


