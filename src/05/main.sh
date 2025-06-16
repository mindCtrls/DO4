source ./checkParam.sh
source ./analyzeModule.sh

haveParameters "$#"
checkInterval "$1"
analyzeLogFile "$1"