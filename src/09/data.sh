  cpuUsage=$(awk '/^cpu / {
    idle = $5;
    total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9 + $10;
    print 100 * (1 - idle / total)
  }' /proc/stat)

  #В Kb
  memTotal=$(awk '/^MemTotal/ {print $2}' /proc/meminfo)
  memFree=$(awk '/^MemFree/ {print $2}' /proc/meminfo)
  memCache=$(awk '/^Cached/ {print $2}' /proc/meminfo)
  memBuff=$(awk '/^Buffers/ {print $2}' /proc/meminfo)
  

  #Будут переданы байты
  diskTotal=$(df / | awk '{print $2}')
  diskUsed=$(df / | awk '{print $3}')
  diskAvail=$(df / | awk '{print $4}')
  