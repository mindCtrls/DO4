recordToLog() {
  local recordFileName="record_$1.log"
  local byteSize=1234
  read -r ip statusCode method date timeZone url agent <<< "$2"
    
  printf "%s - - [%s %s] \"%s %s HTTP/1.1\" %s %s %s\n" \
      "$ip" "$date" "$timeZone" "$method" "$url" "$statusCode" "$byteSize" "$agent" >> "$recordFileName"
}