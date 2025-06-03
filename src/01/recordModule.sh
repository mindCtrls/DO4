recordToLog() {
    local recordFileName="$1record.log"
    local name="$2"
    local dateCreate="$3"
    local size="$4"

    # Определяем тип записи (папка/файл)

    # Форматируем вывод
    printf "%-40s | %-19s | %-6s %s\n" \
        "$name" "$dateCreate" "$size" >> "$recordFileName"
}