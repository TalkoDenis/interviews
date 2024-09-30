### Apache Airflow

_Apache Airflow_ - это платформа открытого исходного кода для управления, планирования и мониторинга рабочих процессов (_workflow_). Он разработан для облегчения создания, планирования и выполнения сложных рабочих процессов, состоящих из множества задач.

#### Основные компоненты Apache Airflow включают:

_DAGs_ (_Directed Acyclic Graphs_) - в _Airflow_ задачи объединяются в направленные ациклические графы (_DAGs_). _DAG_ представляет собой схему, в которой задачи представлены узлами графа, а зависимости между задачами - направленными ребрами. _DAGs_ определяют логику выполнения рабочего процесса и его порядок.

_Operators_ - в _Airflow_ операторы представляют собой атомарные задачи, которые могут выполнять различные операции, такие как выполнение SQL-запросов, запуск скриптов Python, передача данных между системами и другие операции. _Airflow_ предоставляет множество встроенных операторов, а также позволяет создавать пользовательские операторы для удовлетворения специфических потребностей.

_Scheduler_ - планировщик задач в _Airflow_. Он отвечает за выполнение задач в соответствии с определенным расписанием и зависимостями между задачами в _DAG_. Автоматически запускает задачи в нужном порядке, основываясь на их зависимостях и расписании выполнения. Планировщик также управляет перепланированием неудачных задач и обеспечивает отслеживание прогресса выполнения.

_Web UI_ - _Airflow_ предоставляет веб-интерфейс, который позволяет визуализировать и управлять рабочими процессами. Веб-интерфейс предоставляет графическое представление _DAGs_, возможность мониторинга выполнения задач, просмотр журналов выполнения и другие инструменты для управления и отладки рабочих процессов.

_Executors_ - в _Airflow_ существуют различные варианты исполнителей (_executors_), которые определяют, как задачи в _DAG_ будут выполняться. Некоторые из доступных исполнителей включают _Sequential Executor_ (последовательное выполнение задач), _Local Executor_ (локальное выполнение задач на одной машине) и _Distributed Executors_ (распределенное выполнение задач на кластере).

_Airflow_ позволяет разработчикам определять сложные рабочие процессы с помощью кода Python или YAML-файлов, которые определяют _DAGs_ и задачи. Он предлагает богатый набор функциональных возможностей, таких как динамическое расписание, обработка ошибок, управление переменными, масштабирование и многое другое.

_Airflow_ нашел широкое применение в области аналитики данных, _ETL-процессов_, обработки данных и автоматизации бэкенд-задач. Он позволяет упростить и улучшить управление сложными рабочими процессами и обеспечивает прозрачность и контроль над их выполнением.

#### Создание DAG

_DAG_ в _Airflow_  - это _.py_ файл, который в итоге и содержит всю необходимую для автоматизации информацию.

Создание _DAG_ в _Apache Airflow_ осуществляется путем определения класса Python, который наследуется от базового класса _DAG_. В этом классе определяются задачи и их зависимости, а также другие параметры, связанные с выполнением рабочего процесса.

Пример простого _DAG_ в _Airflow_:

```
from airflow import DAG
from airflow.operators.bash import BashOperator

from datetime import datetime

default_args = {
    'start_date': datetime(2024, 10, 1),
    'owner': 'airflow',
}

dag = DAG(
    'my_dag',
    default_args=default_args,
    description='My first DAG',
    # Ежедневное выполнение.
    schedule_interval='@daily',  
)

task1 = BashOperator(
    task_id='task1',
    bash_command='echo "Task 1"',
    dag=dag
)

task2 = BashOperator(
    task_id='task2',
    bash_command='echo "Task 2"',
    dag=dag
)

# Определение зависимости между задачами
task1 >> task2  

```
Пояснение, что написано выше:

1. Импорт библиотек:

_airflow_ - импортирует библиотеку _Airflow_, которая используется для создания и управления _DAG_.

_BashOperator_ - импортирует класс _BashOperator_ из библиотеки _Airflow_, который используется для выполнения Bash-команд в качестве задач.

_datetime_ - импортирует модуль _datetime_ из стандартной библиотеки, который используется для работы с датами и временем.

2. Определение аргументов по умолчанию:

_default_args_ - создает словарь _default_args_, который задает аргументы по умолчанию для всех задач в _DAG_.

_start_date_ - устанавливает дату начала _DAG_ на 1 октября 2024 года.

_owner_ - устанавливает владельца _DAG_ на _'airflow'_, что является общепринятым значением по умолчанию.

3. Создание DAG:

_dag = DAG(...)_ - создает объект _DAG_ с именем _dag_ с помощью следующих параметров:

_'my_dag'_ - задает имя _DAG_ как _'my_dag'_.

_default_args=default_args_ - указывает словарь аргументов по умолчанию, определенный ранее.

_description='Мой первый DAG'_ - предоставляет описание _DAG_.

_schedule_interval='@daily'_ - устанавливает интервал выполнения _DAG_ для ежедневного запуска.

4. Определение задач:

_task1 = BashOperator(...)_ - создает объект задачи _task1_ типа _BashOperator_ с помощью следующих параметров:

_task_id='task1'_ - устанавливает _ID_ задачи на _'task1'_.

_bash_command='echo "Задача 1"'_ - указывает Bash-команду для выполнения, которая выводит "Задача 1" в консоль.

_dag=dag_ - назначает задачу объекту dag.

_task2 = BashOperator(...)_ - создает объект задачи _task2_ типа _BashOperator_ с помощью следующих параметров:

_task_id='task2'_ - устанавливает _ID_ задачи на _'task2'_.

_bash_command='echo "Задача 2"'_ - указывает Bash-команду для выполнения, которая выводит "Задача 2" в консоль.

_dag=dag_ - назначает задачу объекту dag.

5. Зависимости задач:

_task1 >> task2_ - определяет зависимость между задачами task1 и task2, указывающую, что task2 должна выполняться только после успешного завершения task1.

Этот код определяет простой _DAG_, который последовательно выполняет две Bash-задачи.

#### Операторы Airflow

Операторы в _Apache Airflow_ - это базовые строительные блоки, которые определяют, что должно быть выполнено в рабочем процессе. Они могут выполнять все, начиная от выполнения Python-скриптов до выполнения SQL-запросов или запуска других программ.

Они являются одними из ключевых элементов, используемых для создания и определения задач в рамках _DAG_. Каждая задача в _Airflow_ определяется с помощью оператора, который определяет, что именно нужно выполнить.

#### Типы операторов в Airflow

Операторы в Airflow можно разделить на несколько основных категорий в зависимости от их функциональности:

_Action Operators_ - выполняют определенные действия или задачи. Например:

_BashOperator_ - выполняет bash-команду.

_PythonOperator_ - выполняет функцию Python.

_EmailOperator_ - отправляет email.

_Transfer Operators_ - перемещают данные между различными источниками и приемниками. Например:

    _S3ToRedshiftOperator_ - переносит данные из _Amazon S3_ в _Redshift_.
    
    _GoogleCloudStorageToBigQueryOperator_ - загружает данные из _Google Cloud Storage_ в _BigQuery_.

_Sensor Operators_ - ожидают наступления определенного события или условия.

Для создания задачи в _Airflow_, необходимо определить оператор в том самом файле Python, который описывает _DAG_. Каждый оператор требует задания уникального _task_id_, который идентифицирует задачу внутри _DAG_. Операторы также могут принимать множество параметров, которые определяют их поведение.

Основные параметры, которые могут быть настроены в большинстве операторов, включают:

_task_id_ - уникальный идентификатор задачи в рамках _DAG_.

_start_date_ - дата и время, начиная с которых задача активна.

_retries_ - количество попыток повторного выполнения задачи в случае её неудачного завершения.

_retry_delay_ - задержка между попытками повторного выполнения.

_schedule_interval_ - интервал, с которым задача должна выполняться.

Вот некоторые из наиболее часто используемых операторов в _Airflow_:

_BashOperator_ - запускает команды в операционной системе, используя интерпретатор командной строки (например, _Bash_).

Пример выглядит так:

```
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

dag = DAG('bash_example', start_date=datetime(2024, 10, 1))

task1 = BashOperator(
    task_id='print_date',
    bash_command='date',
    dag=dag
)

task2 = BashOperator(
    task_id='echo_hello',
    bash_command='echo "Hello Airflow"',
    dag=dag
)

task1 >> task2

```

Этот _DAG_ с двумя задачами, которые выполняются последовательно. Первая задача (_task1_) выводит текущую дату, а вторая задача (_task2_) выводит строку _"Hello Airflow"_. 

_PythonOperator_ - выполняет произвольный код Python в рамках оператора. Пример выглядит так:

```
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

dag = DAG('python_example', start_date=datetime(2024, 10, 1))

def print_hello():
    print("Hello Airflow")

task = PythonOperator(
    task_id='print_hello',
    python_callable=print_hello,
    dag=dag
)

```

Этот DAG с одной задачей, которая выполняет функцию _print_hello_, выводящую строку _"Hello Airflow"_.

_EmailOperator_ - отправляет электронные письма. Пример выглядит так:

```
from airflow import DAG
from airflow.operators.email import EmailOperator

from datetime import datetime

dag = DAG('email_example', start_date=datetime(2024, 10, 1))

task = EmailOperator(
    task_id='send_email',
    to='recipient@example.com',
    subject='Airflow Email',
    html_content='<p>This is an Airflow email.</p>',
    dag=dag
)
```

Этот DAG с одной задачей, которая отправляет электронное письмо с помощью _EmailOperator_.

_SQLExecuteQueryOperator_ - выполняет SQL-запросы на заданном подключении к базе данных. Пример выглядит так:

```
from airflow import DAG
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator

from datetime import datetime

dag = DAG('sql_example', start_date=datetime(2024, 1, 1))

task = SQLExecuteQueryOperator(
    task_id='run_sql',
    sql='SELECT * FROM my_table',
    database='my_database',
    dag=dag
)
```

Этот DAG с одной задачей, которая выполняет запрос с помощью _SQLExecuteQueryOperator_

_DockerOperator_ - запускает контейнеры _Docker_. Пример выглядит так:

```
from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator

from datetime import datetime

dag = DAG('docker_example', start_date=datetime(2023, 1, 1))

task = DockerOperator(
    task_id='run_container',
    image='my_image:latest',
    command='python script.py',
    dag=dag
)
```

Этот _DAG_ с одной задачей, которая запускает Docker-контейнер из указанного образа с помощью оператора DockerOperator, плюс python script.py выполняется внутри контейнера.

HiveOperator: Выполняет операции Hive.

S3FileTransferOperator: Копирует файлы между локальной файловой системой и Amazon S3.

SlackAPIOperator: Отправляет сообщения в Slack.

SparkSubmitOperator: Отправляет задачи Spark для выполнения на кластере Apache Spark.

HttpOperator: Выполняет HTTP-запросы к удаленным серверам.

При использовании операторов в Airflow рекомендуется:

Использовать параметры для управления поведением операторов, чтобы сделать выполнение задач более гибким и настраиваемым.
Определять зависимости между задачами ясно и логически, используя set_upstream() или set_downstream(), либо операторы >> и <<.
Избегать запуска тяжелых процессов непосредственно в операторах, таких как PythonOperator, и вместо этого вызывать внешние скрипты или сервисы.
Это лишь некоторые из операторов, доступных в Apache Airflow. Каждый оператор имеет свои уникальные аргументы, которые позволяют настроить его поведение. Вы также можете создавать собственные пользовательские операторы, наследуемые от базового класса BaseOperator, чтобы выполнить специфические для вашего рабочего процесса задачи.

Когда вы определяете свой рабочий процесс (DAG), вы можете использовать эти операторы, чтобы создать последовательность задач, задать их зависимости и управлять выполнением. Пример использования операторов вы можете найти в документации Apache Airflow и в тех примерах, которые мы отключили при развертывании.

 

На данном этапе важно понять смысл использования операторов в Airflow - понять что это и есть те элементы DAGа, которые как кирпичики складывают Ваш процесс в единое целое. Я бы рекомендовал для начала просто поискать в приведенных примерах операторы и осознать то, что они делают в каждом примере.


Параметры Default Args

Параметры default_args используются для определения значений по умолчанию для атрибутов в объекте DAG (Directed Acyclic Graph) в Apache Airflow. Эти параметры могут быть применены ко всем задачам (операторам) внутри этого DAG, если для них не указаны собственные значения. Вот некоторые распространенные параметры default_args:

1.      owner (str): Владелец или автор DAG. Это имя пользователя или группы, ответственных за данный DAG.

2.      depends_on_past (bool): Определяет, зависит ли выполнение каждой задачи от успешного завершения ее предыдущей итерации (если True).

3.      start_date (datetime): Дата и время, с которой начинается выполнение DAG. Это может быть указано как строка в формате 'YYYY-MM-DD' или объект datetime.

4.      end_date (datetime): Дата и время, после которых выполнение DAG больше не будет запускаться. Обычно используется для установки конечного срока выполнения DAG.

5.      retries (int): Количество попыток выполнения задачи в случае ошибки.

6.      retry_delay (timedelta): Время задержки между попытками выполнения задачи в случае ошибки.

7.      email (str): Адрес электронной почты, на который будут отправляться уведомления о статусе выполнения DAG.

8.      email_on_failure (bool): Указывает, следует ли отправлять уведомления о неудачных попытках выполнения задачи по электронной почте.

9.      email_on_retry (bool): Указывает, следует ли отправлять уведомления о повторных попытках выполнения задачи по электронной почте.

10.  schedule_interval (str or timedelta): Интервал, с которым запускается DAG. Может быть строкой в формате «cron» или объектом timedelta.

11.  max_active_runs (int): Максимальное количество активных запусков DAG одновременно.

 

12.  catchup (bool): Определяет, должен ли DAG выполнять задачи для пропущенных интервалов времени, если это включено.

Основные параметры

# Определение параметров default_args
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,  # Установлен в False, что означает, что выполнение задач не зависит от результатов их предыдущих запусков.
    'start_date': datetime(2023, 1, 1),  # Установлен на 1 января 2023 года.
    'end_date': None,  # Нет конечной даты
    'retries': 1,  # Retries установлен на 1, что означает одну попытку выполнения задачи в случае ошибки.
    'retry_delay': timedelta(minutes=5),  # Retry delay установлен на 5 минут между попытками выполнения задачи в случае ошибки.
    'email': 'your_email@example.com',  # Email установлен как ваш адрес электронной почты.
    'email_on_failure': True,  # Установлен в True, что означает отправку уведомлений о неудачных попытках выполнения задачи по электронной почте.
    'email_on_retry': False,  # Установлен в False, что означает, что уведомления о повторных попытках выполнения задачи по электронной почте не отправляются
    'schedule_interval': '@daily',  # Ежедневное выполнение
    'max_active_runs': 1,  # Установлено на 1, что ограничивает количество одновременных активных запусков DAG до 1.
    'catchup': False,  # Установлено в False, что отключает выполнение задач для пропущенных интервалов времени.
}

# Создание объекта DAG с использованием параметров default_args
dag = DAG('example_dag', default_args=default_args, catchup=False)
Время и частота запуска

1.      'start_date': datetime(2023, 1, 1), 'schedule_interval': '@daily':

    DAG начнет выполняться с 1 января 2023 года.
   Затем DAG будет запускаться ежедневно (каждый день) в течение всего периода, не имея конечной даты.
2.      'start_date': datetime(2023, 1, 1), 'schedule_interval': timedelta(days=2):

   DAG начнет выполняться с 1 января 2023 года.
   Затем DAG будет запускаться каждые 2 дня (каждые 48 часов) в течение всего периода, не имея конечной даты.
3.      'start_date': datetime(2023, 1, 1), 'schedule_interval': '@hourly':

   DAG начнет выполняться с 1 января 2023 года.
   Затем DAG будет запускаться каждый час в течение всего периода, не имея конечной даты.
4.      'start_date': datetime(2023, 1, 1), 'schedule_interval': None:

   DAG начнет выполняться с 1 января 2023 года.
   Однако, в этом случае DAG не будет выполняться автоматически по расписанию, и выполнение должно быть запущено вручную.
5.      'start_date': datetime(2023, 1, 1), 'schedule_interval': '0 0 * * *':

  DAG начнет выполняться с 1 января 2023 года.
  Затем DAG будет запускаться каждый день в полночь (согласно cron-выражению '0 0 * * *') в течение всего периода, не имея конечной даты.
6.      'start_date': datetime(2023, 1, 1), 'schedule_interval': '@weekly':

  DAG начнет выполняться с 1 января 2023 года.
  Затем DAG будет запускаться еженедельно (раз в неделю) в течение всего периода, не имея конечной даты.



#### Airflow UI (Пользовательский Интерфейс)
Airflow предоставляет веб-интерфейс, который позволяет пользователям визуально управлять выполнением и мониторингом рабочих процессов. Веб-интерфейс предоставляет следующие возможности:

DAG Overview: Просмотр всех DAGs, доступных в системе, с информацией о том, когда каждый DAG был запущен, его статус и интерактивное представление структуры DAG.
Task Instance Details: Подробная информация о каждой задаче в рамках DAG, включая логи выполнения, время начала и окончания, а также текущий статус.
Code Viewing: Возможность просмотра кода, который определяет каждый DAG, прямо из интерфейса.
Triggering & Clearing: Возможность ручного запуска или очистки задач для тестирования или оперативного управления.
Gantt Chart & Graph View: Визуализация выполнения DAG в виде диаграммы Ганта или графического представления, что помогает анализировать продолжительность и зависимости задач.
Scheduling (Планирование)
Планирование в Airflow относится к автоматическому запуску рабочих процессов на предварительно заданных интервалах. Это осуществляется с помощью cron-подобных выражений, которые позволяют очень гибко настраивать частоту запуска. Возможности планирования включают:

Start Date: Дата и время, с которого начнется выполнение первого запуска DAG.
End Date: Опциональная дата и время, после которых DAG больше не будет запускаться.
Interval: Расписание, по которому DAG должен выполняться (например, ежедневно, каждые пять минут и т.д.).






#### Переменные, подключения и XCom

В Apache Airflow переменные, подключения и XCom являются важными концепциями для управления конфигурацией, подключениями к внешним источникам данных и обмена данными между задачами в рамках рабочего процесса.

Переменные (Variables): Переменные в Airflow представляют собой ключ-значение пары, которые могут быть использованы для хранения конфигурационных данных и параметров, доступных в вашем рабочем процессе. Некоторые примеры использования переменных могут включать настройки подключения к базе данных, настройки авторизации и другие параметры, которые могут меняться в зависимости от окружения выполнения. Переменные можно определить и настроить через веб-интерфейс Airflow или использовать API для программного управления ими. Для доступа к переменным в коде задачи вы можете использовать объект Variable модуля airflow.models.

Подключения (Connections): Подключения в Airflow представляют собой параметры, необходимые для установки связи с внешними источниками данных, такими как базы данных, сервисы облачных провайдеров, API и другие ресурсы. Эти параметры, такие как хост, порт, имя пользователя, пароль и другие, могут быть настроены и управляются в веб-интерфейсе Airflow или через API. Подключения в Airflow могут быть использованы в коде задач для установки соединения с внешними источниками данных. Для доступа к подключениям в коде задачи вы можете использовать объект Connection модуля airflow.hooks.base.

XCom: XCom (Cross Communication) в Airflow представляет собой механизм обмена данными между задачами внутри рабочего процесса. XCom позволяет передавать и получать данные между задачами в виде ключ-значение пары. Это может быть полезно, когда вам нужно передать результат выполнения одной задачи в другую задачу для дальнейшей обработки. Задачи могут читать и записывать XCom значения с использованием методов xcom_pull() и xcom_push() соответственно. Для доступа к XCom значениям в коде задачи вы можете использовать объект context (контекст выполнения) и методы модуля airflow.models.

Важно отметить, что переменные, подключения и XCom в Airflow являются частями метаданных и хранятся в базе данных метаданных Airflow. Это обеспечивает централизованное управление и доступ к этим данным в рамках вашего рабочего процесса.

 

#### Переменные

В Apache Airflow переменные можно создать через веб-интерфейс Airflow или с использованием API. Вот примеры создания переменных с использованием обоих подходов:

1. Создание переменных через веб-интерфейс Airflow:

Перейдите в веб-интерфейс Airflow ( доступен по адресу http://localhost:8080).
В меню выберите «Admin» и затем «Variables».
Нажмите кнопку «Create» или «Add Variable».
Введите имя переменной (Key) и значение переменной (Value).
Нажмите кнопку «Save» или «Add».

2. Создание переменных с использованием API: Вы также можете использовать API для программного создания переменных. Вот пример использования API Python для создания переменной:

```
import requests

# URL для создания переменной
url = 'http://localhost:8080/api/v1/variables'

# Параметры запроса
headers = {'Content-Type': 'application/json'}
data = {
    'key': 'my_variable',
    'value': 'my_value'
}

# Отправка POST-запроса для создания переменной
response = requests.post(url, headers=headers, json=data)

# Проверка статуса ответа
if response.status_code == 200:
    print('Переменная успешно создана')
else:
    print('Ошибка при создании переменной:', response.status_code)
```

В этом примере мы отправляем POST-запрос на URL /api/v1/variables с указанием имени переменной (Key) и ее значения (Value) в формате JSON. Если ответ имеет код состояния 200, значит переменная была успешно создана.

Когда переменная создана, вы можете использовать ее в коде ваших задач с помощью объекта Variable модуля airflow.models. Вот пример использования переменной в коде -  в этом примере мы получаем значение переменной с помощью Variable.get() и выводим его в задаче с помощью функции my_task().:

```
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.models import Variable
from datetime import datetime

def my_task():
    my_variable = Variable.get("my_variable")
    print(my_variable)

with DAG('my_dag', schedule_interval='@daily', start_date=datetime(2024, 1, 1)) as dag:
    task = PythonOperator(task_id='my_task', python_callable=my_task)
```




##### Подключения

В Apache Airflow подключения можно создавать как через веб-интерфейс Airflow, так и с использованием API. Вот примеры создания подключений с использованием обоих подходов:

1. Создание подключений через веб-интерфейс Airflow:

Перейдите в веб-интерфейс Airflow ( доступен по адресу http://localhost:8080).
В меню выберите «Admin» и затем «Connections».
Нажмите кнопку «Create» или «Add Connection».
Заполните поля для подключения, такие как Conn Id (идентификатор подключения), Conn Type (тип подключения), Host, Port, Login, Password и другие, в зависимости от типа подключения.
Нажмите кнопку «Save» или «Add».
2. Создание подключений с использованием API: Вы также можете использовать API для программного создания подключений. Вот пример использования API Python для создания подключения к базе данных PostgreSQL:

```
import requests

# URL для создания подключения
url = 'http://localhost:8080/api/v1/connections'

# Параметры запроса
headers = {'Content-Type': 'application/json'}
data = {
    'conn_id': 'my_postgres_conn',
    'conn_type': 'postgres',
    'host': 'localhost',
    'port': '5432',
    'login': 'my_user',
    'password': 'my_password',
    'schema': 'my_schema'
}

# Отправка POST-запроса для создания подключения
response = requests.post(url, headers=headers, json=data)

# Проверка статуса ответа
if response.status_code == 200:
    print('Подключение успешно создано')
else:
    print('Ошибка при создании подключения:', response.status_code)

```
В этом примере мы отправляем POST-запрос на URL /api/v1/connections с указанием параметров подключения в формате JSON. Если ответ имеет код состояния 200, значит подключение было успешно создано.

Когда подключение создано, вы можете использовать его в коде ваших задач с помощью объекта Connection модуля airflow.hooks.base. Вот пример использования подключения в коде:

```
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.hooks.base_hook import BaseHook
from datetime import datetime

def my_task():
    my_conn = BaseHook.get_connection("my_postgres_conn")
    print(f"Host: {my_conn.host}")
    print(f"Login: {my_conn.login}")

with DAG('my_dag', schedule_interval='@daily', start_date=datetime(2024, 1, 1)) as dag:
    task = PythonOperator(task_id='my_task', python_callable=my_task)

```

В этом примере мы получаем подключение с помощью BaseHook.get_connection() и выводим некоторые параметры подключения в задаче с помощью функции my_task(). 






Теперь хотелось продемонстрировать, как выглядят переменные и подключения и как можно автоматизировать их добавление c помощью DAG.

МЫ уже определились, что variables и connections по сути своей пары "ключ-значение". Получается что мы сможем сохранить из в соответствующем файле. Как вы можете помнить это JSON.

Для примера возьмем ситуацию, где нам необходимо в процессе выполнения DAG использовать подключение к базе данных PostgreSQL. Для этого мы создаем файл connections.json в таком виде:

```
{
  "conn1": {
    "conn_type": "postgres",
    "description": "Подключение к базе данных",
    "login": "postgres",
    "password": "password",
    "host": "host.docker.internal",
    "port": 5430,
    "schema": "test",
    "extra": "{}"
 }
}
```

А также в процессе нашей задачи требуется использовать какие-то значения, которые негоже писать прям в коде (API ключи, какие-то параметры, подключения те же именовать). Для этого мы создадим файл variables.json в таком виде:

```
{
    "base_url": "https://www.тут-нужная-вам-ссылка.co/query",
    "conn_name": "conn1",
    "function": "TIME_SERIES_INTRADAY",
    "interval": "15min",
    "symbol_apple": "AAPL",
    "apikey": "----------",
    "outputsize": "full"
    
}

```

 Отлично! Теперь давайте создадим DAG который назовем init, который будет добавлять наши переменные и подключения в Airflow автоматически, при помощи bash-оператора:

```
from datetime import datetime, timedelta, date
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.empty import EmptyOperator
from airflow.utils.task_group import TaskGroup

# аргументы дага по умолчанию
default_args = {
    "owner": "user",
    "retries": 0,
    "start_date": datetime.today()
}

# функция добавления переменных в airflow

with DAG(dag_id="01_init",description = 'Прикручиваем connections и variables', default_args=default_args, schedule_interval='@once', catchup=False) as dag:

    start = EmptyOperator(task_id='start')

    with TaskGroup("01_init", tooltip="Добавление connections") as init_tg:

        # ****************** добавление переменных ***********************

        set_variables = BashOperator(
            task_id = 'set_variables',
            bash_command='airflow variables import /opt/airflow/dags/variables.json'
        )

        # ****************** добавление connecions ***********************

        set_connections = BashOperator(
            task_id='set_connections',
            bash_command='airflow connections import /opt/airflow/dags/connections.json'
        )

    end = EmptyOperator(task_id='end')

    start >> init_tg >> end

```

Вуаля! 





##### XComs (Cross-Communication)

XComs, или механизм кросс-коммуникации, позволяет задачам в Airflow обмениваться сообщениями или данными между собой. Каждая задача может "вытолкнуть" сообщение в XCom с помощью метода xcom_push, и другие задачи могут "вытянуть" это сообщение с помощью метода xcom_pull.

Это особенно полезно в сценариях, где результат выполнения одной задачи требуется для начала выполнения другой. Например, задача, которая обрабатывает данные, может передать результаты другой задаче, которая использует эти данные для обновления базы данных или отправки уведомлений.

XComs хранятся в базе данных Airflow, что делает этот механизм надежным и эффективным для управления данными между задачами.

```
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

def push_data(**context):
    context['ti'].xcom_push(key='my_data', value='Hello, Airflow!')

def process_data(**context):
    my_data = context['ti'].xcom_pull(key='my_data')
    print(my_data)

with DAG('xcom_example_dag', schedule_interval='@daily', start_date=datetime(2024, 1, 1)) as dag:
    push_task = PythonOperator(
        task_id='push_task',
        python_callable=push_data,
        provide_context=True
    )

    process_task = PythonOperator(
        task_id='process_task',
        python_callable=process_data,
        provide_context=True
    )

    push_task >> process_task

```

В этом примере у нас есть две задачи: push_task и process_task.

В задаче push_task мы определяем функцию push_data(), которая отправляет данные 'Hello, Airflow!' в XCom с помощью метода xcom_push(). Мы используем аргумент **context, чтобы получить доступ к контексту выполнения задачи, и вызываем context['ti'].xcom_push() для отправки данных в XCom. Мы указываем ключ 'my_data' и значение 'Hello, Airflow!'.

В задаче process_task мы определяем функцию process_data(), которая получает данные из XCom с помощью метода xcom_pull(). Мы снова используем аргумент **context, чтобы получить доступ к контексту выполнения задачи, и вызываем context['ti'].xcom_pull() с ключом 'my_data', чтобы получить данные из XCom. Затем мы просто выводим полученные данные.

Затем мы связываем задачи push_task и process_task с помощью оператора >>, чтобы определить порядок их выполнения.

При выполнении этого DAG задача push_task сначала отправляет данные в XCom, а затем задача process_task получает эти данные из XCom и выводит их.




В Apache Airflow сенсоры (Sensors) используются для мониторинга определенных условий или событий и ожидания, пока эти условия не будут выполнены. Сенсоры позволяют вам создавать задачи, которые ожидают внешние события или изменения состояний, прежде чем продолжить выполнение DAG. Вот некоторые примеры сенсорных операторов в Airflow:

1. ExternalTaskSensor: Этот сенсор ожидает завершения определенной задачи (внешней задачи) в другом DAG. Вот пример использования ExternalTaskSensor:

```
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.sensors import ExternalTaskSensor
from datetime import datetime

with DAG('my_dag', schedule_interval='@daily', start_date=datetime(2023, 1, 1)) as dag:
    task1 = DummyOperator(task_id='task1')

    task2 = ExternalTaskSensor(task_id='wait_for_task1', external_dag_id='other_dag', external_task_id='task1')

    task1 >> task2

```

В этом примере у нас есть две задачи: task1 и wait_for_task1. Задача wait_for_task1 является сенсором и ожидает завершения задачи task1 в другом даге с идентификатором 'other_dag'. Когда task1 в другом даге завершится, wait_for_task1 продолжит выполнение.

2. FileSensor: Этот сенсор ожидает появление определенного файла на файловой системе. Вот пример использования FileSensor:

```
from airflow import DAG
from airflow.operators.sensors import FileSensor

from datetime import datetime

with DAG('my_dag', schedule_interval='@daily', start_date=datetime(2023, 1, 1)) as dag:
  wait_for_file = FileSensor(
      task_id='wait_for_file',
      filepath='/path/to/my/file.txt'
  )

```

В этом примере у нас есть задача wait_for_file, которая ожидает появление файла /path/to/my/file.txt на файловой системе. Когда файл будет обнаружен, задача wait_for_file продолжит выполнение.

3. HttpSensor: Этот сенсор выполняет HTTP-запрос и ожидает успешный ответ от сервера. Вот пример использования HttpSensor:

```
from airflow import DAG
from airflow.operators.sensors import HttpSensor

from datetime import datetime

with DAG('my_dag', schedule_interval='@daily', start_date=datetime(2023, 1, 1)) as dag:
    wait_for_api = HttpSensor(
        task_id='wait_for_api',
        http_conn_id='my_http_conn',
        endpoint='/api/health'
    )

```

В этом примере у нас есть задача wait_for_api, которая выполняет HTTP-запрос на эндпоинт /api/health с использованием соединения с идентификатором 'my_http_conn'. Сенсор ожидает успешный ответ от сервера (код ответа 2xx). Когда успешный ответ будет получен, задача wait_for_api продолжит выполнение.




