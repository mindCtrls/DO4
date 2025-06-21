  read -r _ user nice system idle iowait irq softirq steal _ < <(grep '^cpu ' /proc/stat)
  prevTotal=$((user + nice + system + idle + iowait + irq + softirq + steal))
  prevIdle=$idle

  sleep 15

  read -r _ user nice system idle iowait irq softirq steal _ < <(grep '^cpu ' /proc/stat)
  total=$((user + nice + system + idle + iowait + irq + softirq + steal))
  idle=$idle

  totalDiff=$((total - prevTotal))
  idleDiff=$((idle - prevIdle))
  cpuUsage=$(awk -v td=$totalDiff -v id=$idleDiff 'BEGIN {printf "%.2f", 100 * (td - id) / td}')

  #В Kb
  memTotal=$(awk '/^MemTotal/ {print $2}' /proc/meminfo)
  memFree=$(awk '/^MemFree/ {print $2}' /proc/meminfo)
  memCache=$(awk '/^Cached/ {print $2}' /proc/meminfo)
  memBuff=$(awk '/^Buffers/ {print $2}' /proc/meminfo)
  

  #Будут переданы байты
  diskTotal=$(df / | awk '{print $2}')
  diskUsed=$(df / | awk '{print $3}')
  diskAvail=$(df / | awk '{print $4}')
  