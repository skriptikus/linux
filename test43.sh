#!/bin/bash
k=$(wc -l /var/www/html/sysinfo/test.sc | awk '{print $1}')
count=0
cat /var/www/html/sysinfo/test.sc | head -n$count | tail -n1 | awk '{ for(i=1; i<7; i++){ print ("<td>" $i "</td>")}}'
pygmentize (){
if [[ $(echo "$1 > 90" | bc) -eq 1 ]]; then
OUT="<span style='color: red;'>$2</span>"
elif [[ $(echo "(80 < ($1)) && (($1) < 90)" | bc) -eq 1 ]]; then
OUT="<span style='color: yellow;'>$2</span>"
else
OUT="<span style='color: green;'>$2</span>"
fi
echo $OUT
}
echo "<body><table>"
echo "<table><th>File system</th><th>I-nodes</th><th>I-used</th><th>I-free</th><th>I-used%</th><th>Mounted in</th>"
while [ $count -lt $k ]
do
count=$(( $count + 1 ))
echo "<tr>"
cat /var/www/html/sysinfo/test.sc | head -n$count | tail -n1 | awk '{ for(i=1; i<5; i++){ print ("<td>" $i "</td>")}}'
echo "<td>"
d=$(cat /var/www/html/sysinfo/test.sc | head -n$count | tail -n1 | awk '{print $5}' | cut -d"%" -f1)
t=$(cat /var/www/html/sysinfo/test.sc | head -n$count | tail -n1 | awk '{print $5}')
pygmentize $d $t
echo "</td>"
cat /var/www/html/sysinfo/test.sc | head -n$count | tail -n1 | awk '{print ("<td>" $6 "</td>")}'
echo "</tr>"
done;
echo "</table>"
echo "<br />"
echo "</body>"

