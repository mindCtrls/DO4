source ./checkParam.sh
source ./removeModule.sh

scriptStartTime=$(date +"%Y-%m-%d %H:%M:%S")

haveParameters "$#"
checkInterval "$1"
removeFileDir "$1"