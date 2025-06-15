  declare -a agentArr
  agentArr[0]="Mozilla"
  agentArr[1]="Google Chrome"
  agentArr[2]="Opera"
  agentArr[3]="Safari"
  agentArr[4]="Internet Explorer"
  agentArr[5]="Microsoft Edge"
  agentArr[6]="Crawler and bot"
  agentArr[7]="Library and net tool"

  declare -a methodeArr
  methodeArr[0]="GET"
  methodeArr[1]="POST"
  methodeArr[2]="PUT"
  methodeArr[3]="PATCH"
  methodeArr[4]="DELETE"

  declare -a codeArr
  codeArr[0]="200" # Все ок
  codeArr[1]="201" # Все ок, что-то создано (обычно на put и post)
  codeArr[2]="400" # Ошибка клиента. Сервер не может/не будет обрабатывать запрос (синтаксис, формат, маршрутизация)
  codeArr[3]="401" # Клиент должен быть аутентифицирован
  codeArr[4]="403" # У клиента нет прав до ресурса
  codeArr[5]="404" # Сервер не может найти ресурс (маскируют 403)
  codeArr[6]="500" # На сервере ошибка из-за чего не может обработать запрос
  codeArr[7]="501" # Метод запроса не поддерживается сервером. get и head всегда работают!!!!
  codeArr[8]="502" # Сервер вернет такое, если используется в качестве шлюза. А целевой не смог обработать запрос
  codeArr[9]="503" # Сервер не готов обработать запрос в данный момент

  declare -a urlArr
  urlArr[0]="/"
  urlArr[1]="/info"
  urlArr[2]="/clients"
  urlArr[3]="/clients/Europe"
  urlArr[4]="/profile"
  urlArr[5]="/offer"
  urlArr[6]="/news"
  urlArr[7]="/events"
  urlArr[8]="/register"
  urlArr[9]="/login"