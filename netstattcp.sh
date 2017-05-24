#!/bin/bash
z=$(wc -l netstattcp.txt | awk '{print $1}')
c=0
while [ $c -lt $z ]
do
c=$(( $c + 1 ))
cat netstattcp.txt | head -n$c | tail -n1
echo "<br />"
done;
echo "<br />";

