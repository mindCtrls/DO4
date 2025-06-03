source ./recordModule.sh #Возможно говнокод

typeArray=(dir file)

#Массив под виды логов
# [0] - Создание папки
# [1] - Создание файла
checkFreeSpace() {

space=$(df -m --output=avail / | tail -1)
space=$(($space/1024))

if [[ "$space" -lt 1 ]]; then
	echo "Free space less 1GB"
	exit 1
fi
}

getDate() {
    local path="$1"
    local type="$2"
    date=$(stat -c "%y" "$path" | awk '{print $1, $2}')
    echo "${date%.*}"
}

createName() {
  local index=$1          # номер итерации/индекс
  local chars_in_name=$2  # строка символов, например "az"
  local new_name=""
  local len=${#chars_in_name}

  local index_arr=$(( index % len ))
  local repetition=$(( index / len ))

  for (( j=0; j<len; j++ )); do
    local simb="${chars_in_name:j:1}"
    new_name+="$simb"
    if (( j == index_arr )); then
      for (( k=0; k<=repetition; k++ )); do
	new_name+="$simb"
      done
    fi
  done
  echo "$new_name"

}

createFiles() {
local path=$1
local basePath=$(echo $1 | awk -F"/" '{print $1}')
local basePath="$basePath/"

local countFiles=$2

local fileSizeKb=$4

local fileSize=$(echo "$4" | awk -F"[a-z]" '{print $1}')
local fileSize=$(($fileSize * 1024))

local fileName=$(echo $3 | awk -F"." '{printf $1}')
local fileExtension=$(echo $3 | awk -F"." '{printf $2}')

for ((i=0; i<$countFiles; i++)); do
	name=$(createName "$i" "$fileName")
	dateFormat=$(date +"%d%m%y")
	name="$path/${name}_$dateFormat.$fileExtension"
	$(touch $name)
	$(truncate -s +"$fileSize" "$name")

	date=$(getDate "$name" "${typeArray[1]}")
	recordToLog "$basePath" "$name" "$date" "$fileSizeKb"
	checkFreeSpace
	
done
}

createFolders() {
# $1 - путь
# $2 - число папок
# $3 - буквы для папок
# $4 - число файлов
# $5 - буквы для файлов
# $6 - размер файлов

path=$1
countFolders="$2"
countFiles="$4"
arrayFolderCharacter="$3"
arrayFileCharacter="$5"
fileSize="$6"

for ((k=0; k<$countFolders; k++)); do
	name=$(createName "$k" "$arrayFolderCharacter")
	dateFormat=$(date +"%d%m%y")
	name="$path${name}_$dateFormat"
	$(mkdir "$name")
		
	dateFolder=$(getDate "$name" "${typeArray[1]}")	
	recordToLog "$path" "$name" "$dateFolder"
	checkFreeSpace
	
	createFiles "$name" "$countFiles" "$arrayFileCharacter" "$fileSize"
	
	path=$1
 done
}
