recordToLog() {
  local recordFileName="$1record.log"
  local name=$(realpath "$2")
  local dateCreate="$3"
  local size="$4"
    
  printf "%-100s | %-19s | %-6s\n" \
      "$name" "$dateCreate" "$size" >> "$recordFileName"
}
