haveParameters() {

# Число параметров равно 1
if [[ $1 -ne 6 ]]; then
	if [[ $1 -eq 0 ]]; then
                echo "Parameters not found"
                exit 1
        fi
        if [[ $1 -gt 6 ]]; then
                echo "To many parameters"
                exit 1
        fi
        if [[ $1 -lt 6 ]]; then
                echo "To few parameters"
                exit 1
        fi
fi
}

#Проверка паарметра 1
isExistDirectory() {

if [[ ! -d "$1" ]]; then
	echo "Directory is not exist"
	exit 1
fi

}

#Проверка параметра 2 и 4
checkIsNumber(){

if [[ ! $1 =~ ^[0-9]+$ ]]; then
	echo "Wrong path format"
	exit 1
fi
}

#Проверка параметра 3
check_folder_char() {
if [[! $1 =~ ^[a-zA-z]{1,7}$ ]]
	echo "Wrong characters for folders"
	exit 1
fi
}

#Проверка параметра 5
check_file_char() {
if [[! $1 =~ ^[a-zA-z]{1,7}.[a-zA-Z]{1,3}$ ]]
	echo "Wrong characters for files"
	exit 1
fi
}

#Проерка парамтра 6
check_file_size() {
if [[! $1 =~ ^[1-9]?[0-9]?[0]?kb$ ]]
	echo "Wrong size file"
	exit 1
fi	
}


