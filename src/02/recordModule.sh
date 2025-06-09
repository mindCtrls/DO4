recordToLog() {

  local recordFileName=$(pwd)
  local recordFileName="$recordFileName/record.log"
  local name=$(realpath "$1")
  local dateCreate="$2"
  local size="$3"
    
  printf "%-100s | %-19s | %-6s %s\n" \
      "$name" "$dateCreate" "$size" >> "$recordFileName"

}


printExecuteTime() {

  startTime="$1"
  endTime=$(date +"%Y-%m-%d %H:%M:%S")

  unixTimeStart=$(date -d "$startTime" +%s)
  unixTimeEnd=$(date -d "$endTime" +%s)
  executionTime=$(($unixTimeEnd-$unixTimeStart))

  printf "%-40s\n %-40s\n %-40s\n" \
      " Время начала:$startTime" "Время окончания работы:$endTime" "Время выполнения:$executionTime секунд"

}