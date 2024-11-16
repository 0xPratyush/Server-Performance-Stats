#!/bin/bash

echo "============================"

echo "######SERVER STATS######"

echo "============================"

# CPU Usage
cpuusage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "Total CPU usage: $cpuusage"

echo "============================"

memory=$(free -h)
totalMemory=$(echo "$memory" | grep Mem | awk '{print $2}')
usedMemory=$(echo "$memory" | grep Mem | awk '{print $3}')
freeMemory=$(echo "$memory" |grep Mem | awk '{print $4}')

# calculating%
usedMemoryP=$(echo "$usedMemory $totalMemory" | awk '{print $1/$2*100}')
freeMemoryP=$(echo "$usedMemoryP" | awk '{print 100-$1}')

echo "Total Memory: $totalMemory"
echo "Used Memory: $usedMemory  | which is $usedMemoryP"%""
echo "Free Memory: $freeMemory  | which is $freeMemoryP"%""

echo "============================"

#Total disk usage (Free vs Used including percentage)
storage=$(df / )
totalStorage=$(echo "$storage" | grep / | awk '{print $2}')
usedStorage=$(echo "$storage" | grep / | awk '{print $3}')
freeStorage=$(echo "$storage" | grep / | awk '{print $4}')
#calculating %
usedStorageP=$(echo "$storagep" | grep / | awk '{print $3/$2*100}')
freeStorageP=$(echo "$usedStorageP" | awk '{print 100-$1}')

echo "Total Storage: $totalStorage"
echo "Used Storage: $usedStorage  | which is $usedMemoryP"%""
echo "Free Storage: $freeStorage  | which is $freeMemoryP"%""

echo "============================"

echo "Top 5 Processes by CPU usage:"
ps -eo pid,%cpu,%mem,comm --sort=-%cpu | head -n 6

echo "============================"

echo "Top 5 Processes by memory usage:"
ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6