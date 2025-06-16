source ./randomModule.sh
source ./recordModule.sh
source ./data.sh

# Убрать говнокод
getIp() {
  local ip=$(getRandom "255")

  for ((i=0; i<3; i++)) {
    local value=$(getRandom "255")
    ip="$ip.$value"
  }

  echo "$ip"
}

getStatusCode() {
  local code=${codeArr[$(getRandom "10")]}

  echo "$code"
}


getMethode() {
  local methode=${methodeArr[$(getRandom "5")]}

  echo "$methode"
}

getUrl() {
  local url=${urlArr[$(getRandom "10")]}

  echo "$url"
}

getAgent() {
  local agent=${agentArr[$(getRandom "8")]}

  echo "$agent"
}

getDate() {
  local day=$((19 + $1))
  local mon=Feb
  local year=2025
  local timeZone=+0700

  local hour=0
  local min=0
  local sec=0

  local newValue=$2
  ((sec += newValue))

  if ((sec >= 60)); then
    ((min += sec / 60))
    ((sec %= 60))
  fi
  if ((min >= 60)); then
    ((hour += min / 60))
    ((min %= 60))
  fi

  printf -v day "%02d" "$day"
  printf -v hour "%02d" "$hour"
  printf -v min "%02d" "$min"
  printf -v sec "%02d" "$sec"

  echo "$day/$mon/$year:$hour:$min:$sec $timeZone"
}

oneLogCreate() {
  local ip=$(getIp)
  local statusCode=$(getStatusCode)
  local methode=$(getMethode)
  local date=$(getDate "$1" "$2")
  local url=$(getUrl)
  local agent=$(getAgent)

  echo "$ip $statusCode $methode $date $url $agent"
}

makeLogs() {
  local countIterates=$(getRandom "100" "1000")

  for ((i=0; i<5; i++)) {
    local secIterator=$(getRandom "60")
    
    for ((j=0; j<"$countIterates"; j++)) {
      recordToLog "$i" "$(oneLogCreate "$i" "$secIterator")"

      local newValue=$(getRandom "60")
      ((secIterator += newValue))
    }
  }
}

makeLogs
