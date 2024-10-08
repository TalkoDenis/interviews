

# Что такое Apache Spark?

_Apache Spark_ - это многоязычный движок для выполнения обработки данных, обработки данных и машинного обучения на одноузловых компьютерах или кластерах в памяти RAM. Spark основан на Hadoop MapReduce и расширяет модель MapReduce, позволяя эффективно использовать ее для большего количества типов вычислений, включая интерактивные запросы и потоковую обработку.

Spark предоставляет высокоуровневые API-интерфейсы (другими словами - библиотеки) на Java, Scala, Python и R, а также оптимизированный движок, поддерживающий общие графы выполнения.

Движок Apache Spark работает на JVM (Java), поэтому для запуска заданий и разработки приложений на компьютере должен быть установлен JDK (Java Development Kit - бесплатно распространяемый компанией Oracle Corporation комплект разработчика приложений на языке Java, включающий в себя компилятор Java, стандартные библиотеки классов Java, примеры, документацию, различные утилиты и исполнительную систему Java).

Движок Spark также поддерживает богатый набор инструментов более высокого уровня, включая:

_Spark SQL_ - для обработки SQL и структурированных данных;

_API-интерфейс pandas в Spark_ - для рабочих нагрузок pandas;

_MLlib_ - для машинного обучения;

_GraphX_ - для обработки графов;

_Structured Streaming_ - для потоковой обработки.

#### Плюсы Apache Spark

Высокая скорость и производительность обработки данных за счет распределительных вычислениий на множестве машин in-memory.

Удобные для разработчиков инструменты. Spark предоставляет удобные для разработчиков инструменты, которые работают с помощью простого вызова метода. Spark также обеспечивает привязку к языкам для R, Python, Scala и Java.

Широкий выбор библиотек для алгоритмов машинного обучения и анализа графов, которые позволяют решать различные задачи аналитики. Spark даёт возможность обработки данных в памяти с малой задержкой.

Структурированная потоковая передача Spark Streaming

Поддержка _Lazy Evaluation (Ленивые вычисления)_ - это означает, что Apache Spark будет ждать всей инструкции перед ее обработкой.

#### Минусы Apache Spark

Apache Spark требует много оперативной памяти для обработки данных, что напрямую будет влиять на стоимость владения инструментом.

При работе со Spark требуется ручная оптимизация заданий, а также наборов данных. Для создания разделов пользователи могут самостоятельно указать количество разделов Spark. Для этого в качестве параметра метода parallelize необходимо передать количество фиксируемых разделов. Чтобы получить правильные разделы и кеш, все эти процедуры разделов должны контролироваться вручную.

Spark сложно настраивать и обслуживать. Это означает, что обеспечить максимальную производительность, чтобы она не прогибалась под тяжелыми рабочими нагрузками по обработке данных, сложно. Нужно учесть многие параметры: выделение памяти, количество ядер, доступные для работы Spark, количество памяти на каждый исполнитель, и т.п.

Нет системы управления файлами.

Spark не полностью поддерживает обработку потока данных в реальном времени.

В потоковой передаче Spark данные делятся на небольшие пакеты на основе заданных интервалов времени. Таким образом, Apache Spark поддерживает time-based window criteria, но не на основе записей.

Плохое быстродействие UDF в PySpark (Slowness of PySpark UDFs): UDF на питоне приводит к тому, что происходит двойное преобразование данных между приложением и UDF.

#### Что такое Resilient Distributed Datasets (RDD) — Устойчивые распределенные наборы данных?

_Resilient Distributed Datasets (RDD)_ - это фундаментальная структура данных Spark. Это неизменяемая распределенная коллекция объектов. Каждый набор данных в RDD разделен на логические разделы, которые могут быть вычислены на разных узлах кластера. RDD могут содержать объекты Python, Java, R или Scala любого типа, включая определяемые пользователем классы.

_RDD_ - это отказоустойчивый набор элементов, с которыми можно работать параллельно.

Существует два способа создания RDD:

1) распараллеливание существующей коллекции в программе-драйвере;

2) ссылка на набор данных во внешней системе хранения, такой как общая файловая система, HDFS, HBase или любой источник данных, предлагающий входной формат Hadoop.

Spark использует концепцию RDD для достижения более быстрых и эффективных операций MapReduce.

#### Что такое Apache PySpark?

_PySpark_ - это библиотека Spark, написанная на Python для запуска приложений Python с использованием возможностей Apache Spark. Используя PySpark, можно запускать приложения параллельно в распределенном кластере (несколько узлов). Другими словами, PySpark — это API Python для Apache Spark.

Spark в основном написан на Scala, а позже, благодаря адаптации к отрасли, это API PySpark, выпущенный для Python с использованием Py4J.

Py4J — это библиотека Java, которая интегрирована в PySpark и позволяет python динамически взаимодействовать с объектами JVM, поэтому для запуска PySpark также необходимо установить Java вместе с Python и Apache Spark.

Spark выполняет операции с миллиардами и триллионами данных в распределенных кластерах в 100 раз быстрее, чем традиционные приложения Python.

#### Кто использует PySpark?

PySpark очень хорошо используется в сообществе Data Science и Machine Learning, поскольку существует множество широко используемых библиотек для обработки данных, написанных на Python, включая NumPy, TensorFlow. Также используется из-за эффективной обработки больших наборов данных.

#### Сравнение Apache PySpark с Python Pandas

Pandas выполняет операции на одной машине, тогда как PySpark работает на нескольких машинах.

Pandas не поддерживает распределенную обработку, поэтому вам всегда нужно увеличивать ресурсы, когда вам нужна дополнительная мощность для поддержки ваших растущих данных.

#### Архитектура Apache Spark & PySpark

Как работает Apache Spark?

_Apache Spark_ - это распределенная вычислительная система, которая используется для обработки больших объемов данных. Spark обеспечивает эффективную обработку данных, позволяя распределенно выполнить вычисления на кластере из множества узлов.

Система Apache Spark состоит из нескольких компонентов, включая:

Driver: Это основной процесс, который инициирует и контролирует выполнение задач на кластере.

Executor: Это процесс, который выполняет конкретную задачу на узле кластера.

Cluster Manager: Управляет кластером и выделяет ресурсы для выполнения задач.

-- Картинка 1

Spark использует концепцию RDD (Resilient Distributed Datasets), что позволяет ему работать с данными, которые распределены по нескольким узлам кластера. RDD представляет собой неизменяемый набор элементов, который можно распределить и обрабатывать параллельно.


-- Картинка 2

Основная идея Spark заключается в том, чтобы обрабатывать данные в памяти, минимизируя использование дискового пространства. Для этого Spark использует in-memory computing, что позволяет обрабатывать данные намного быстрее, чем при использовании традиционных технологий обработки данных.

Программирование в Spark осуществляется с использованием API на языке Scala, Java, Python или R. Spark также предоставляет удобный интерфейс для обработки SQL-запросов, а также библиотеки машинного обучения и графовых вычислений.

Самый распространенный способ запуска Spark на кластере — это использование Apache Hadoop YARN или Apache Mesos в качестве менеджера ресурсов. При этом Spark взаимодействует с HDFS (Hadoop Distributed File System) для доступа к данным. Также Spark может быть запущен в режиме standalone на локальной машине или на кластере без использования Hadoop.


#### Что такое RDD (Resilient Distributed Datasets) и как оно работает?

RDD (Resilient Distributed Datasets) — это распределенный набор данных в Apache Spark, который может храниться и обрабатываться на множестве узлов кластера. RDD является неизменяемым и отказоустойчивым, что означает, что если какой-либо узел кластера выходит из строя, данные могут быть восстановлены из копий, хранящихся на других узлах.

RDD может быть создан из данных, загруженных из внешних источников, например из файловой системы Hadoop или из базы данных. Кроме того, RDD может быть создан из других RDD, путем применения различных преобразований данных, таких как отображение, фильтрация, сортировка и т.д.

Преобразования RDD являются ленивыми, то есть они не выполняются немедленно, а только при вызове действий (actions) над RDD. Действия возвращают результаты вычислений, которые могут быть использованы в дальнейшей обработке данных или записаны во внешние хранилища данных.

Когда RDD создан, он автоматически распределяется по узлам кластера и может быть кэширован в памяти, чтобы обеспечить более быстрый доступ к данным в будущем. При необходимости данные могут быть дополнительно разбиты на части и параллельно обработаны на разных узлах кластера.

RDD предоставляет мощный инструментарий для распределенной обработки данных в Apache Spark, который позволяет анализировать большие объемы данных быстро и эффективно, благодаря параллельному выполнению вычислений на кластере.


#### Как работает Apache PySpark?

PySpark позволяет анализировать и обрабатывать данные, используя язык Python.

Работа PySpark начинается с создания объекта SparkContext, который связывает приложение Python с кластером Spark. После создания SparkContext можно создавать объекты RDD (Resilient Distributed Datasets), которые представляют собой распределенные коллекции объектов, над которыми можно выполнять различные операции.

PySpark также предоставляет множество функций для обработки данных, включая функции фильтрации, сортировки, агрегации, объединения и т.д. Все эти функции могут быть применены к RDD, что позволяет обрабатывать большие объемы данных быстро и эффективно.

Кроме того, PySpark поддерживает SQL-запросы через модуль Spark SQL, который позволяет использовать SQL-запросы для работы с данными. Модуль Spark SQL предоставляет объект DataFrame, который является распределенной таблицей данных, и который можно использовать для выполнения различных операций над данными.

PySpark также поддерживает машинное обучение и обработку потоков данных через модули MLlib и Spark Streaming соответственно. MLlib предоставляет множество алгоритмов машинного обучения, которые можно использовать для обучения моделей на больших объемах данных, а Spark Streaming позволяет обрабатывать потоковые данные в режиме реального времени.

В целом, PySpark предоставляет мощный инструментарий для обработки данных в распределенной среде, который позволяет использовать высокопроизводительные вычисления на кластере для обработки больших объемов данных в Python.

#### Как работает Spark SQL?

Spark SQL — это модуль Apache Spark, который позволяет выполнять обработку структурированных данных, используя язык SQL. Он предоставляет объект DataFrame, который является распределенной таблицей данных, схожей с таблицами в реляционных базах данных.

DataFrame в Spark SQL может быть создан из различных источников, включая CSV-файлы, JSON-файлы, базы данных и т.д. DataFrame также может быть создан из RDD, используя метод toDF(), который преобразует RDD в DataFrame.

DataFrame в Spark SQL поддерживает множество операций, включая фильтрацию, сортировку, агрегацию, группировку, объединение и т.д. Все эти операции могут быть выполнены с использованием языка SQL или с использованием функций API DataFrame.

DataFrame в Spark SQL является ленивым, так же как и RDD, и выполняет преобразования только при вызове действий (actions) над DataFrame. Это позволяет оптимизировать производительность обработки данных, так как Spark SQL может объединять несколько операций в один физический план выполнения, что снижает накладные расходы на выполнение операций.

DataFrame в Spark SQL также поддерживает машинное обучение, благодаря интеграции с модулем MLlib. Это позволяет выполнять обработку данных и обучение моделей машинного обучения в единой экосистеме Apache Spark.

В целом, DataFrame в Spark SQL предоставляет удобный и мощный способ работы с данными, который позволяет выполнять операции с высокой производительностью в распределенной среде.

#### Что такое SparkContext, как оно работает, где хранится? Как SparkContext взаимодействует с DataFrame и RDD?

SparkContext — это главный входной точкой для любой операции в Apache Spark, и это объект, который отвечает за связь между приложением и кластером Spark. Он предоставляет интерфейс для создания RDD и других структур данных, а также для настройки параметров приложения, таких как конфигурация и кэширование.

Когда приложение Spark запускается, SparkContext создается автоматически. Каждое приложение Spark имеет свой собственный SparkContext, который может быть доступен через переменную среды «sc». SparkContext управляет пулом ресурсов, включая выделение памяти, настройку задач, распределение задач по кластеру, отслеживание выполнения задач и другие операции.

SparkContext хранится в памяти кластера и управляет выполнением операций на RDD и DataFrame. Взаимодействие между SparkContext и DataFrame/RDD происходит через методы SparkContext, которые позволяют создавать, преобразовывать и агрегировать данные внутри RDD/DataFrame.

DataFrame взаимодействует с SparkContext через методы DataFrame, которые позволяют создавать, преобразовывать и агрегировать данные внутри DataFrame. SparkContext используется для выполнения операций на DataFrame, таких как фильтрация, сортировка, объединение, агрегирование и другие.

RDD взаимодействует с SparkContext через методы RDD, которые позволяют создавать, преобразовывать и агрегировать данные внутри RDD. SparkContext используется для выполнения операций на RDD, таких как фильтрация, сортировка, объединение, агрегирование и другие.

В целом, SparkContext является центральным элементом взаимодействия между приложением Spark и кластером, а DataFrame и RDD используют SparkContext для выполнения операций в памяти кластера.


#### В чем разница между DataFrame в Spark SQL и RDD?

В Spark SQL объект DataFrame и объект RDD (Resilient Distributed Dataset) являются двумя разными концепциями для обработки данных.

Основные различия между DataFrame и RDD следующие:

Структура данных: DataFrame — это распределенная таблица данных с определенной структурой (набор столбцов и типов данных для каждого столбца), тогда как RDD — это распределенный набор неструктурированных данных (набор объектов).

Производительность: DataFrame имеет лучшую производительность по сравнению с RDD за счет оптимизированной обработки структурированных данных и использования оптимизированных движков выполнения запросов, таких как Catalyst и Tungsten. RDD могут иметь более низкую производительность, поскольку не имеют структуры данных и могут быть обработаны только с помощью более общих методов.

Удобство использования: DataFrame проще и удобнее использовать благодаря своей структурированной форме и языку SQL, который облегчает выполнение запросов и фильтрации данных. RDD более гибкий и может быть использован для обработки неструктурированных данных и выполнения более сложных операций.

Машинное обучение: DataFrame в Spark SQL интегрирован с модулем машинного обучения MLlib, что облегчает выполнение операций машинного обучения на структурированных данных. RDD не имеют встроенной поддержки машинного обучения и могут быть использованы только с использованием дополнительных библиотек и инструментов.

В целом, DataFrame в Spark SQL лучше подходит для работы со структурированными данными, в то время как RDD лучше подходят для обработки неструктурированных данных или выполнения более сложных операций.


#### Где хранится RDD в Apache Spark?

RDD (Resilient Distributed Dataset) в Apache Spark — это распределенный набор данных, который хранится в памяти кластера и может быть управляемым программно.

Фактические места хранения RDD зависят от того, как они создаются и используются в приложении Spark. В общем, RDD могут храниться в памяти кластера (RAM) или на диске (HDD или SSD).

Если RDD помещаются в память кластера, они могут храниться в кэше (cache) Spark и использоваться для быстрого доступа и повторного использования в различных операциях. Кроме того, RDD могут храниться на диске, если они не помещаются в память кластера.

Распределенное хранение данных RDD также может быть управляемым, что означает, что можно управлять тем, как часто и где RDD должны сохраняться на диске, как они будут кэшироваться и какие данные должны быть выгружены из памяти.

Кроме того, Spark поддерживает несколько видов хранения данных, таких как HDFS (Hadoop Distributed File System), S3 (Amazon Simple Storage Service) и другие, что позволяет сохранять RDD на диске в распределенном хранилище данных и загружать их при необходимости.

В целом, места хранения RDD зависят от различных факторов, включая размер и тип данных, доступную память и доступ к кластеру. Однако, Spark обеспечивает гибкость в управлении хранением RDD, что позволяет оптимизировать производительность приложений Spark в зависимости от потребностей приложения.



#### При перезагрузке сервера RDD как восстанавливается в памяти?

При перезагрузке сервера RDD (Resilient Distributed Dataset) восстанавливается в памяти с использованием механизма кэширования Spark.

Spark обеспечивает механизмы управления памятью кластера и кэширования данных, которые позволяют сохранять RDD в памяти кластера между запросами и перезапусками. Кэширование Spark позволяет сохранять RDD в памяти кластера на долгое время, пока они не будут удалены вручную или автоматически для освобождения памяти.

При создании RDD, вы можете указать, что RDD должен быть кэширован с помощью метода persist() или cache(). Когда RDD кэшируется, он сохраняется в памяти кластера и доступен для повторного использования в различных операциях, включая операции по работе с данными и вычислениями.

Если происходит перезагрузка сервера, то Spark запустит автоматический процесс восстановления кэшированных RDD из журнала транзакций, который содержит информацию о состоянии RDD. Spark использует эту информацию для восстановления RDD в памяти кластера, после чего они становятся доступными для повторного использования в приложении.

Важно отметить, что восстановление RDD может занять некоторое время, в зависимости от размера и сложности RDD. Поэтому рекомендуется управлять кэшированием RDD и выполнять его наиболее важные части, чтобы минимизировать время восстановления после перезагрузки сервера.



#### DataFrame в Spark SQL

DataFrame в Spark SQL — это распределенная таблица данных, которая может быть хранимой в различных местах в памяти кластера, в зависимости от того, как она создана и используется.

При создании DataFrame в Spark SQL, вы можете загрузить данные из различных источников, таких как Hadoop Distributed File System (HDFS), Amazon S3, Apache Cassandra, Apache HBase, Apache Kafka и другие. Данные могут быть хранимы в различных форматах, таких как CSV, JSON, Parquet, Avro и другие.

Когда данные загружаются в DataFrame, они могут быть кэшированы в памяти кластера или на диске, в зависимости от настроек кэширования. DataFrame может быть создан из RDD, в таком случае, DataFrame может быть храним в памяти кластера также как и RDD.

DataFrame в Spark SQL хранится в памяти кластера в форме распределенных блоков данных, называемых партициями (partitions). Каждая партиция содержит некоторое количество строк таблицы, которые могут быть обработаны параллельно в рамках кластера. Число партиций может быть настроено в зависимости от требований приложения и доступных ресурсов.

По умолчанию, Spark SQL сохраняет DataFrame в памяти кластера, но это может быть изменено с помощью настроек кэширования. DataFrame может быть кэширован в памяти кластера, на диске или в обоих местах одновременно. Кроме того, Spark SQL поддерживает различные стратегии кэширования, которые могут быть выбраны в зависимости от типа и размера DataFrame.

В целом, DataFrame в Spark SQL может быть хранимым в памяти кластера, на диске или в обоих местах одновременно. DataFrame хранится в форме распределенных блоков данных, называемых партициями, которые могут быть обработаны параллельно в рамках кластера.



FAQs по Apache Spark
Как управлять обработками данных в PySpark? Есть ли какой-то Scheduler встроенный для Spark? Интегрируется ли Apache Spark с Apache Airflow?
Управление обработками данных в PySpark осуществляется с помощью управления задачами (job management) и мониторинга выполнения задач (task monitoring). Управление задачами в PySpark осуществляется с помощью объекта SparkContext, который запускает и распределяет задачи между узлами кластера.

Для управления и планирования выполнения задач в Spark можно использовать встроенный планировщик задач (Task Scheduler), который автоматически распределяет задачи между узлами кластера. В Spark можно выбрать различные планировщики задач, такие как FIFO, Fair и другие, в зависимости от конкретных потребностей приложения.

Apache Spark также интегрируется с Apache Airflow, который является платформой управления рабочими процессами и позволяет автоматизировать и планировать выполнение PySpark задач. Apache Airflow позволяет создавать DAG (Directed Acyclic Graph) задач, которые определяют зависимости между задачами и планируют их выполнение в определенном порядке. Для выполнения PySpark задач в Apache Airflow используется оператор SparkSubmitOperator, который запускает задачи в Spark кластере через командную строку.



Когда следует выбирать Apache Spark, а когда достаточно использовать Apache Airflow со скриптами на Python?
Apache Spark и Apache Airflow являются разными инструментами и предназначены для решения различных задач. Apache Spark предназначен для обработки больших объемов данных в режиме реального времени и масштабируется для работы с кластером серверов. Spark может использоваться для различных задач, включая машинное обучение, обработку потоковых данных, аналитику больших данных и другие.

Apache Airflow, в свою очередь, является платформой для управления рабочими процессами (workflow management platform) и предназначен для автоматизации и оркестрации задач внутри комплексных рабочих процессов. Airflow позволяет планировать выполнение задач в определенном порядке, управлять зависимостями между задачами, запускать задачи в определенное время и т.д.

Если задача связана с обработкой больших объемов данных в режиме реального времени, то Apache Spark является лучшим выбором. Если же задача связана с автоматизацией и оркестрацией сложных рабочих процессов, в которых есть зависимости между задачами, то Apache Airflow может быть более подходящим инструментом.

Кроме того, Apache Spark и Apache Airflow могут использоваться совместно для выполнения сложных рабочих процессов, где Apache Spark может использоваться для обработки данных, а Apache Airflow — для автоматизации запуска задач и управления процессами.


#### Насколько Apache Spark подходит для etl?

Apache Spark подходит очень хорошо для ETL (ETL: Extract, Transform, Load). Он был разработан с учетом обработки больших объемов данных и позволяет эффективно обрабатывать данные как в пакетном режиме (batch), так и в потоковом режиме (streaming).

При обработке данных в batch режиме Apache Spark позволяет работать с данными из различных источников (например, файловой системы, баз данных, кластеров Hadoop и т.д.), выполнять операции трансформации и агрегации данных, а также сохранять результаты в различных форматах.

Важным преимуществом Apache Spark является его способность к распараллеливанию обработки данных на кластере, что позволяет значительно ускорить обработку данных в сравнении с традиционными инструментами.

Таким образом, Apache Spark является отличным выбором для обработки данных в batch режиме.

#### Какие типы данных используются для обработки и хранения данных в Apache Spark?

Apache Spark поддерживает множество типов данных для обработки и хранения данных. Некоторые из наиболее распространенных типов данных, используемых в Apache Spark, перечислены ниже:

Числовые типы данных: целые числа (IntegerType), числа с плавающей точкой (FloatType и DoubleType), длинные целые числа (LongType), короткие целые числа (ShortType) и т.д.

Типы данных для работы со строками: строки (StringType), бинарные данные (BinaryType) и т.д.

Логические типы данных: логические значения (BooleanType).

Дата/временные типы данных: DateType, TimestampType и т.д.

Сложные типы данных: массивы (ArrayType), структуры (StructType), множества (MapType) и т.д.

Нестандартные типы данных: например, типы данных для работы с геопространственными данными (GeometryType), типы данных для работы с JSON (JsonType) и т.д.

Кроме того, Spark позволяет определять пользовательские типы данных (UserDefinedType), что позволяет разработчикам создавать собственные типы данных для специфических задач.

#### Как Apache Spark хранит данные и что происходит в момент обращения к данным внутри

Apache Spark использует распределенную файловую систему Hadoop (HDFS - Hadoop Distributed File System - Распределённая Файловая Система Hadoop) для хранения больших наборов данных. HDFS разделяет данные на блоки и распределяет их по нескольким узлам кластера. Каждый блок данных имеет дубликаты, что позволяет обеспечить отказоустойчивость и защиту от потери данных.

Когда Spark обращается к данным, он сначала читает блоки данных из HDFS на узлы кластера. Затем Spark выполняет операции обработки данных на этих узлах, распределяя вычислительные задачи между узлами кластера. Каждый узел обрабатывает данные локально, минимизируя задержки из-за сетевых переходов.

Кроме того, Spark использует механизм кэширования данных, чтобы ускорить доступ к часто используемым данным. Spark сохраняет промежуточные результаты обработки данных в памяти кластера и повторно использует их при необходимости. Это позволяет избежать повторной загрузки данных из HDFS, что может существенно ускорить выполнение вычислительных задач.

При обращении к данным внутри Spark, данные сначала загружаются в память кластера, если они еще не находятся там. Затем Spark использует распределенные операции обработки данных, такие как фильтрация, сортировка и группировка, чтобы извлечь нужную информацию. Результаты операций обработки данных могут быть сохранены в HDFS или переданы другой части вычислительной системы для дальнейшей обработки.




