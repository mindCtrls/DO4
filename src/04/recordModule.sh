recordToLog() {

  local recordFileName="record_$1.log"
  
  local ip="$2"
  local statusCode="$3"
  local method="$4"
  local date="$5"
  local url="$6"
  local agent="$7"
    
  printf "%-18s | %-5s | %-8s | %-19s | %-40s | %-30s \n" \
      "$ip" "$statusCode" "$methode" "$date" "$url" "$agent" >> "$recordFileName"

}


printExecuteTime() {

  startTime="$1"
  endTime=$(date +"%Y-%m-%d %H:%M:%S")

  unixTimeStart=$(date -d "$startTime" +%s)
  unixTimeEnd=$(date -d "$endTime" +%s)
  executionTime=$(($unixTimeEnd-$unixTimeStart))

  printf "%-40s\n %-40s\n %-40s\n" \
      " Время начала: $startTime" "Время окончания работы: $endTime" "Время выполнения: $executionTime секунд"

}