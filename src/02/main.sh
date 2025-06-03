source ./checkParam.sh
source ./createModule.sh


haveParameters "$#"
isExistDirectory "$1"
checkIsNumber "$2"
checkFolderChar "$3"
checkIsNumber "$4"
checkFileChar "$5"
checkFileSize "$6"

createFolders "$1" "$2" "$3" "$4" "$5" "$6"