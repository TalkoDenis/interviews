### Практика

Тут скрипт для создания базы данных и дальнейшей работы. Обратите внимание, я всё написано на PostgreSQL!

Ещё одно важное замечание. Вопросы разделены на два вида: попроще и посложнее. Задания попроще включают в себя одну базу данных, задания сложнее - пожохую, но немного более видоизменённую.
Ниже есть скрипты для создания таблиц, загрузки данных и дальнейшего удаления таблиц. Если вы хотите потренироваться сперва на простых заданиях, потом на сложных, вам нужно сперва загрузить одну базу данных, потом удалить её, и загрузить новую!
  
<details>
<summary>Удаление таблиц (если ранее создали)</summary>

</details>


<details>
<summary>Создание таблиц</summary>

</details>


<details>
<summary>Загрузка данных в таблицы</summary>

</details>


### Задания попроще

#### Задание 1

Вывести все названия самолётов, которые летают из Лондона

<details>
<summary>Решение</summary>

```
SELECT
	DISTINCT plane
FROM
	trip
WHERE town_from = 'London'
```

</details>

<details>
<summary>Ответ</summary>
Boeing
</details>

#### Задание 2

Вывести названия авиакомпаний, чьи самолёты летают из Парижа

<details>
<summary>Решение</summary>

```
SELECT
	DISTINCT name
FROM
	company
WHERE id_comp IN (
					SELECT
						DISTINCT id_comp
					FROM
						trip
					WHERE town_from = 'Paris'
)
```

</details>

<details>
<summary>Ответ</summary>
air_France

British_AW
</details>

#### Задание 3

Вывести имена пассажиров, которые летели из Лондона в Сингапур

<details>
<summary>Решение</summary>

```
SELECT
	DISTINCT p.name
FROM
	pass_in_trip as pit
JOIN passenger AS p
ON pit.id_psg = p.id_psg
WHERE trip_no IN (
					SELECT
						DISTINCT trip_no
					FROM
						trip
					WHERE
							town_from = 'London'
						AND town_to = 'Singapore'
)
```

</details>

<details>
<summary>Ответ</summary>
Harrison Ford
	
Michael Caine

Mullah Omar

Steve Martin
</details>

#### Задание 4

Вывести в алфавитном порядке названия городов, куда летают самолёты марки Боинг

<details>
<summary>Решение</summary>

```
SELECT
	DISTINCT town_to
FROM
	trip
WHERE plane = 'Boeing'
ORDER BY town_to
```

</details>

<details>
<summary>Ответ</summary>
London
	
Paris

Rostov

Singapore
</details>

#### Задание 5

Вывести имена и количество полётов трёх пассажиров, которые летают чаще всех. Имена должн быть отсортированы в алфавитном порядке,
т.е. если несколько пассажиров летают одинаковое количество рейсов, их имена должны идти по алфавиту.

<details>
<summary>Решение</summary>

```
SELECT
	p.name
	, count(*) AS cnt
FROM
	pass_in_trip AS pit
JOIN passenger AS p
ON pit.id_psg = p.id_psg
GROUP BY p.name
ORDER BY
	cnt DESC
	, p.name
LIMIT 3
```

</details>

<details>
<summary>Ответ</summary>
	
| name  | cnt |
| ------------- | ------------- |
| Michael Caine | 4 |
| Mullah Omar | 4 |
| Bruce Willis | 3 |
</details>

#### Задание 6

Сколько пассажиров летит каждым ноябрьским рейсом? Помните, что один и тот же рейс может летать в разные дни. Дайте полям названия Trip, Date, Psg_count. Дату приведите к формату DATE. Ответ отсортируйте по дате и по номеру полёта

<details>
<summary>Решение</summary>

```
SELECT
	trip_no AS Trip
	, date::DATE as Date
	, count(id_psg) AS Psg_count
FROM
	pass_in_trip
WHERE Date BETWEEN '2005-11-01' AND '2005-11-30'
GROUP BY
	Trip
	, Date
ORDER BY 
	Date
	, Trip
```

</details>


<details>
<summary>Ответ</summary>
	
| Trip  | Date | Psg_count |
| ------------- | ------------- | ------------- |
| 7771 | 04.11.2005 | 1 |
| 7778 | 05.11.2005 | 1 |
| 8882 | 06.11.2005 | 1 |
| 7771 | 07.11.2005 | 2 |
| 7772 | 07.11.2005 | 2 |
| 7773 | 07.11.2005 | 1 |
| 8881 | 08.11.2005 | 1 |
| 7771 | 09.11.2005 | 1 |
| 8882 | 13.11.2005 | 1 |
| 7771 | 14.11.2005 | 1 |
| 7771 | 16.11.2005 | 1 |
| 7772 | 29.11.2005 | 3 |
 
</details>

#### Задание 7

В таблице passenger один пассажир попал два раза. Выведите имя этого пассажира. Решить задачу нужно двумя способами!

<details>
<summary>Решение 1 (HAVING)</summary>

```
SELECT
	name
FROM
	passenger
GROUP BY name
HAVING count(*) > 1
```

</details>

<details>
<summary>Решение 2 (подзапрос)</summary>

```
SELECT
	name
FROM
	(
	SELECT
		name
		, COUNT(*) AS cnt
	FROM
		passenger
	GROUP BY name
	) AS t
WHERE cnt > 1
```

</details>

<details>
<summary>Ответ</summary>
Bruce Willis
</details>

#### Задание 8

Вывести имена пассажиров, кто ни разу никуда не летал. Имена отсортировать в алфавитном порядке.

<details>
<summary>Решение</summary>

```
SELECT
	name
FROM passenger
WHERE id_psg NOT IN (
					SELECT
						DISTINCT id_psg
					FROM pass_in_trip )
ORDER BY name
```

</details>


<details>
<summary>Ответ</summary>
	
| name |
| ------------- | 
| Angelina Jolie |
| Antonio Banderas |
| Brad Pitt |
| Bruce Willis |
| Catherine Zeta-Jones |
| Clint Eastwood |
| Donald Sutherland |
| Gary Oldman |
| John Travolta |
| Johnny Depp |
| Kim Basinger |
| Mel Gibson |
| Michael Douglas |
| Pierce Brosnan |
| Sam Neill |
| Samuel L. Jackson |
| Sean Connery |
| Sylvester Stallone |
| Tommy Lee Jones |
</details>

#### Задание 9

Кто из пассажиров заплатил за перелёт больше всего?
Если таких несколько, выведите сперва сумму билетов потом имена пассажиров от большего значения к меньшему.
В итоговом ответе должны быть только сумма билета и имя.

<details>
<summary>Решение</summary>

```
SELECT
	price
	, name
FROM price AS p
JOIN pass_in_trip AS pit
	ON p.trip_no = pit.trip_no
JOIN passenger as psg
	ON pit.id_psg = psg.id_psg
WHERE price = (SELECT MAX(price) from price)
ORDER BY
	price DESC
	, name DESC
```

</details>

<details>
<summary>Ответ</summary>
	
| price | name |
| ------------- | ------------- | 
| 3900 | Mullah Omar |
</details>

#### Задание 10

--

<details>
<summary>Решение</summary>

```

```

</details>

<details>
<summary>Ответ</summary>
	

</details>


#### Задание 

--

<details>
<summary>Решение</summary>

```

```

</details>

<details>
<summary>Ответ</summary>
	

</details>

### Задания посложнее

#### Задание 

--

<details>
<summary>Решение</summary>

```

```

</details>


<details>
<summary>Ответ</summary>

</details>

#### Задание 

--

<details>
<summary>Решение</summary>

```

```

</details>


<details>
<summary>Ответ</summary>

</details>
