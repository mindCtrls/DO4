recordToLog() {
  local recordFileName="record_$1.log"

  read -r ip statusCode method date timeZone request agent pageSize url <<< "$2"
    
  printf "%s - - [%s %s] \"%s %s HTTP/1.1\" %s %s \"%s\" \"%s\"\n" \
      "$ip" "$date" "$timeZone" "$method" "$request" "$statusCode" "$pageSize" "$url" "$agent" >> "$recordFileName"
}