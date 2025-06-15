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
  local code=${codeArr[$(getRandom "9")]}

  echo "$code"
}


getMethode() {
  local methode=${methodeArr[$(getRandom "4")]}

  echo "$methodeArr"
}


getDate() {
  local day=$((19 + $1))
  local mon=Feb
  local year=2025
  local timeZone=+0700

  local hour=01
  local min=00
  local sec=00

  local newValue=$(getRandom "60")
  sec=$((sec + newValue))

  if ((sec >= 60)); then
    min=$((min + sec / 60))
    sec=$((sec % 60))
  fi

  if ((min >= 60)); then
    hour=$((hour + min / 60))
    min=$((min % 60))
  fi

  printf -v day "%02d" "$day"
  printf -v hour "%02d" "$hour"
  printf -v min "%02d" "$min"
  printf -v sec "%02d" "$sec"

  echo "$day/$mon/$year:$hour:$min:$sec $timeZone"
}

getUrl() {
  local url=${urlArr[$(getRandom "9")]}

  echo "$url"
}

getAgent() {
  local agent=${agentArr[$(getRandom "7")]}

  echo "$agent"
}

oneLogCreate() {
  local ip=$(getIp)
  local statusCode=$(getStatusCode)
  local methode=$(getMethode)
  local date=$(getDate $1)
  local url=$(getUrl)
  local agent=$(getAgent)

  echo "$ip $statusCode $methode $date $url $agent"
}

makeLogs() {
local countRecord=$(getRandom "100" "1000")

  for ((i=0; i<5; i++)) {
    for ((j=0; j<"$countRecord"; j++)) {
      recordToLog $i "$(oneLogCreate "$i")"
    }
  }
}

$(makeLogs)