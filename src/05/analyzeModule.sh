path_mask=../04/record_*.log

sortByStatusCode() {
	cat $path_mask | awk '{print}' | sort -n -k9
}

printUnicIp() {
	cat $path_mask | awk '{print $1}' | sort -n -k1 | uniq
}

printErrorStatusCode() {
	cat $path_mask | awk '$9 ~ /^[45][0-9][0-9]$/'
}

printUnicIpAndErr() {
	cat $path_mask | awk '$9 ~ /^[45][0-9][0-9]$/' | awk '{print $1}' | sort -n -k1 | uniq
}

analyzeLogFile() {
	mode=$1

	case $mode in 
		1)
			sortByStatusCode
			;;
		2)
			printUnicIp
			;;
		3)
			printErrorStatusCode
			;;
		4) 
			printUnicIpAndErr
			;;
	esac
}