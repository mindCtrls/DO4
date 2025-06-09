 maxRand=32767
 minRand=0

getCountFolders() {
  local step=$(($maxRand/10)) # 100 это ограничение (кол-во промежутков)
  local countFolders=$(($RANDOM/$step)) 
  countFolders=$(($countFolders+1))
  echo "$countFolders"
}

getCountFiles() {
  local step=$(($maxRand/5)) # 100 это ограничение (кол-во промежутков)
  local countFiles=$(($RANDOM/$step)) 
  countFiles=$(($countFiles+1))
  echo "$countFiles"
}

getRandomDirectory() {
  local dir="$1"
  local max_depth=10  # Защита от бесконечной рекурсии
  local current_depth=${2:-0}

  # Защита от слишком глубокой рекурсии
  if (( current_depth > max_depth )); then
    echo "$dir"
    return
  fi

  # Получаем список поддиректорий безопасным способом
  local subdirs=()
  while IFS= read -r -d $'\0' subdir; do
    subdirs+=("$subdir")
  done < <(find "$dir" -mindepth 1 -maxdepth 1 -type d -print0)

  local countDir=${#subdirs[@]}

  # Если нет поддиректорий, возвращаем текущую
  if (( countDir == 0 )); then
    echo "$dir"
    return
  fi

  # Выбираем случайную поддиректорию
  local random_index=$(( RANDOM % countDir ))
  local selected_dir="${subdirs[random_index]}"

  # С вероятностью 50% идём глубже
  if (( RANDOM % 2 == 0 )); then
    getRandomDirectory "$selected_dir" $(( current_depth + 1 ))
  else
    echo "$selected_dir"
  fi
}