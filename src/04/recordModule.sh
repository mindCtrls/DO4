recordToLog() {
  local recordFileName="record_$1.log"

  read -r ip statusCode method date timeZone request pageSize url agent <<< "$2"
    
  if [[ -s "$recordFileName" ]]; then
      printf "\n" >> "$recordFileName"
  fi

  printf "%s - - [%s %s] \"%s %s HTTP/1.1\" %s %s \"%s\" \"%s\"" \
      "$ip" "$date" "$timeZone" "$method" "$request" "$statusCode" "$pageSize" "$url" "$agent" >> "$recordFileName"
}