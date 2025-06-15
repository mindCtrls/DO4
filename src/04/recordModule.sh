recordToLog() {
  local recordFileName="record_$1.log"
  
  read -r ip statusCode method date url agent <<< "$2"
    
  printf "%-18s | %-5s | %-8s | %-19s | %-40s | %-30s\n" \
      "$ip" "$statusCode" "$method" "$date" "$url" "$agent" >> "$recordFileName"
}