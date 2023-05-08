#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
FREE=$( awk '/MemAvailable/ { print $2 }'  /proc/meminfo)
LOAD=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
THRESHOLD=90
MAX=100
echo $CURRENT
echo $FREE
echo $LOAD
TOTAL=$( awk '/MemTotal/ { print $2 }'  /proc/meminfo)
echo $TOTAL
FREESPACE=$(df / | grep / | awk '{ print $4}')
TOTALSPACE=$(df / | grep / | awk '{ print $2}')
echo $FREESPACE
echo $TOTALSPACE
