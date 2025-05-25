source ./recordModule.sh #Возможно говнокод

#Массив под виды логов
# [0] - Создание папки
# [1] - Создание файла

createFolders() {
# $1 - путь
# $2 - число папок
# $3 - число файлов
#
path=$1
arrayFolderCharacter=""
arrayFilesCharacter=""

for (i=0; i<$2; i++); do
	newName=createFolderName() "" #Массив с нужными буквами
	path=$($path/$newName)
	$(mkdir "$path")
	recordToLog() "$path" "type[0]"
	createFiles() "$3" "$path"

done
}


createFiles() {

for (i=0; i<$1; i++); do
	name=createFileName() "" #Массив с нужными буквами
	$(touch $name)
	recordToLog() "$name" "type[1]"
done
}

createNameFolder() {


return $randomName
}

createFileName() {

return $randomName
}

createArrayFolder() {

}

createArrayCharacter() {

}
