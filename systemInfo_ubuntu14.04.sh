#show the memory info
cat /proc/meminfo
free -m | awk '/Mem/{printf("TotalRamInMB:%s,UsedRamInMB:%s,"), $2, $3} 
/buffers\/cache/{printf("usedBuffersInMB:%s,freeBuffersInMB:%s,"), $3, $4} 
/Swap/{printf("totalSwapInMB:%s,usedSwapInMB:%s\n"), $2, $3}'


#get the total cpu usage 
top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}'


#get the disk info
#df -h
df -h | grep "/$" | awk '//{printf("size:%s,used:%s,available:%s\n"), $2, $3, $4}'

#get the network info

