#show the memory info
#MemTotal:        2047224 kB
#MemFree:          925540 kB
#MemAvailable:     502940 kB
#Buffers:           87564 kB
#Cached:           606840 kB
#SwapCached:          868 kB
#Active:           817636 kB
#Inactive:         192156 kB
#Active(anon):     304452 kB
#Inactive(anon):    71436 kB
#Active(file):     513184 kB
#Inactive(file):   120720 kB
#Unevictable:           0 kB
#Mlocked:               0 kB
#SwapTotal:      11010040 kB
#SwapFree:       10975892 kB
#Dirty:                48 kB
#Writeback:             0 kB
#AnonPages:        315136 kB
#Mapped:            90632 kB
#Shmem:             60500 kB
#Slab:              54104 kB
#SReclaimable:      36720 kB
#SUnreclaim:        17384 kB
#KernelStack:        2960 kB
#PageTables:         3068 kB
#NFS_Unstable:          0 kB
#Bounce:                0 kB
#WritebackTmp:          0 kB
#CommitLimit:    12033652 kB
#Committed_AS:     575452 kB
#VmallocTotal:   34359738367 kB
#VmallocUsed:           0 kB
#VmallocChunk:          0 kB
#DirectMap4k:       14208 kB
#DirectMap2M:     2082816 kB
#DirectMap1G:           0 kB
cat /proc/meminfo
free | awk '/Mem/{printf("used: %.2f%"), $3/$2*100} /buffers\/cache/{printf(", buffers: %.2f%"), $4/($3+$4)*100} /Swap/{printf(", swap: %.2f%"), $3/$2*100}'


#get the total cpu usage 
top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}'


#get the disk info
#df -h
df -h | grep "/$" | awk '//{printf("size:%s,used:%s,available:%s\n"), $2, $3, $4}'
