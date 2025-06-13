# Добавить отслеживание ошибок во все 3 функции

rmByLog() { 
	local log="/home/flox/DO4_LinuxMonitoring_v2.0.ID_356280-1/src/02/record.log"

	while IFS= read -r dir; do
		dir=$(echo "$dir" | xargs)
		if [[ -e "$dir" ]]; then
				rm -rf "$dir"
		fi
	done < <(awk -F'|' '$1 !~ /\.[^/]*$/ {print $1}' "$log")

	# Добавить очистку log file
	# Мозги себе не трахать лишней логикой, при очистке по дате, маске, log file не трогать!!!
	# Просто можно выводить, что столько то записей "12/100" не найдено
}

rmByDate() {
	echo -e "Начало временного промежутка. Пример: \033[32m2025-06-09 11:49\033[0m"
	read -r dateStart
	echo -e "Конец временного промежутка. Пример: \033[32m2025-06-09 11:55\033[0m"
	read -r dateEnd

	# Тут добавить функци для проверки формата даты

	dateStart="$dateStart:00"
	dateEnd="$dateEnd:59"

	echo "$dateStart"
	echo "$dateEnd"
	$(find / \( -name "bin" \
							-o -name "bin64" \
							-o -name "proc" \
							-o -name "lib" \
							-o -name "run" \
							-o -name "var" \
							-o -name "sys" \
							-o -name "snap" \
							-o -name "tmp" \
							-o -name "root" \
							-o -path "/etc/multipath" \) \
									-prune -o -type d -newermt "$dateStart" ! -newermt "$dateEnd" -print -exec rm -rf {} +)\
	$(find / \( -name "bin" \
							-o -name "bin64" \
							-o -name "proc" \
							-o -name "lib" \
							-o -name "run" \
							-o -name "var" \
							-o -name "sys" \
							-o -name "snap" \
							-o -name "tmp" \
							-o -name "root" \
							-o -path "/etc/multipath" \) \
									-prune -o -type f -newecrt "$dateStart" ! -newecrt "$dateEnd" -print -exec rm -rf {} +)
	
}

rmByMask() {
	echo "Введите маску, по которой необходимо удалить файлы"
	read mask


	$(find / \( -name "bin" \
							-o -name "bin64" \
							-o -name "proc" \
							-o -name "lib" \
							-o -name "run" \
							-o -name "var" \
							-o -name "sys" \
							-o -name "snap" \
							-o -name "tmp" \
							-o -name "root" \
							-o -path "/etc/multipath" \) \
									-prune -o -type d -name "$mask" -print -exec rm -rf {} +)
	$(find / \( -name "bin" \
							-o -name "bin64" \
							-o -name "proc" \
							-o -name "lib" \
							-o -name "run" \
							-o -name "var" \
							-o -name "sys" \
							-o -name "snap" \
							-o -name "tmp" \
							-o -name "root" \
							-o -path "/etc/multipath" \) \
									-prune -o -type f -name "$mask" -print -exec rm -rf {} +)
}

removeFileDir() {
	mode=$1

	case $mode in 
		1)
			rmByLog
			;;
		2)
			rmByDate
			;;
		3)
			rmByMask
			;;
	esac
}