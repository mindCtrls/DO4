# Добавить отслеживание ошибок во все 3 функции

rmByLog() { 
	$log="/home/flox/DO4_LinuxMonitoring_v2.0.ID_356280-1/src/02/record.log"

	$directories=$(cat ../02/record.log | awk -F'|' '$1 !~ /\.[^/]*$/ {print $1}')

	while IFS; read -r dir; do
		if [[ -e $dir ]]; then
			$(rm -rf "$dir")
		fi
	done < "$directories"

	# Добавить очистку log file
	# Мозги себе не трахать лишней логикой, при очистке по дате, маске, log file не трогать!!!
	# Просто можно выводить, что столько то записей "12/100" не найдено
}

rmByDate() {
	echo "Начало временного промежутка. Пример: \033[32m2025-06-09 11:49\033[0m"
	read dateStart
	echo "Конец временного промежутка. Пример: \033[32m2025-06-09 11:55\033[0m"
	read dateEnd

	# Тут добавить функци для проверки формата даты

	$dateStart="$dateStart:00"
	$dateEnd="$dateEnd:59"
	$(find / \( -type f -o -type d \) -newerct "$dateStart" ! -newerct "dateEnd" -delete)
}

rmByMask() {
	echo "Введите маску, по которой необходимо удалить файлы"
	read mask

	$(find / \( -type f -o -type d \) -name "$mask" -delete)
}

removeFileDir() {
	mode=$1

	case $mode in 
		1)
			$(rmByLog)
			;;
		2)
			$(rmByDate)
			;;
		3)
			$(rmByMask)
			;;
	esac
}