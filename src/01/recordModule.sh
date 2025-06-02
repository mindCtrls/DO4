recordToLog() {

path=$1
fileName="record.log"
fileName="$path$fileName"

name=$2
dateCreate=$3
size=$4

$(echo $name $dateCreate $size)

echo "$name $dateCreate $size" >> "$fileName"
}
