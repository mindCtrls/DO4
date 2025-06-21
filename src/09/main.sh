#!/bin/bash

source /home/flox/DO4_LinuxMonitoring_v2.0.ID_356280-1/src/09/data.sh

echo "$cpuUsage"

makeData() {
  dir="/var/www/mymetrics/index.html"
  

  cat <<EOF > "$dir"
# HELP cpuUsage CPU usage in percent
# TYPE cpuUsage gauge
cpuUsage $cpuUsage

# HELP memTotal Total memory in KB
# TYPE memTotal gauge
memTotal $memTotal

# HELP memFree Free memory in KB
# TYPE memFree gauge
memFree $memFree

# HELP memCache Cached memory in KB
# TYPE memCache gauge
memCache $memCache

# HELP memBuff Buffers memory in KB
# TYPE memBuff gauge
memBuff $memBuff

# HELP diskTotal Total disk space in bytes
# TYPE diskTotal gauge
diskTotal $diskTotal

# HELP diskUsed Used disk space in bytes
# TYPE diskUsed gauge
diskUsed $diskUsed

# HELP diskAvail Available disk space in bytes
# TYPE diskAvail gauge
diskAvail $diskAvail

EOF
}

makeData

chmod 644 "$dir"