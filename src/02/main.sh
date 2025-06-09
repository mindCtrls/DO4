source ./checkParam.sh
source ./createModule.sh
source ./recordModule.sh

scriptStartTime=$(date +"%Y-%m-%d %H:%M:%S")

haveParameters "$#"
checkFolderChar "$1"
checkFileChar "$2"
checkFileSize "$3"

createFolders "$1" "$2" "$3"

printExecuteTime "$scriptStartTime"