 maxRand=32767
 minRand=0

getRandom() {
  local value=0

  if [[ $# -eq 2 ]]; then
    
    local min=$1
    local max=$2

    while [[ $value -lt $min ]]; do
      value=$(($RANDOM%$max))
    done
    
  else 
  
    local max=$1
    value=$(($RANDOM%$max))
    
  fi
  
  value=$(( $value+1 ))
  echo "$value"

}