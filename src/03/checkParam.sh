haveParameters() {

if [[ $1 -ne 1 ]]; then
        if [[ $1 -eq 0 ]]; then
                echo "Parameters not found"
                exit 1
        fi
        if [[ $1 -gt 1 ]]; then
                echo "To many parameters"
                exit 1
        fi
fi
}

checkInterval(){

if [[ ! $1 =~ ^[1-3]$ ]]; then
	echo "Wrong count files/folders"
	exit 1
fi
}
