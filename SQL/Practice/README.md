![image](https://github.com/TalkoDenis/interviews/assets/107505040/60b3b060-6b30-4c90-bc5e-e463455bc3d4)### Практика

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

Каждый полёт приносит авиакомпании определённые деньги. Посчитайте, какой процент доходов составляет каждый полёт.

В итоговом ответе вывести номер полёта, дату полёта, цену полёта, и какой процент конкретно этот полёт составляет от остальных аналогичных полётов. Последний столбец назвать proportion. Округлить поле по правилам математического округления. Результат отсортировать по номеру полёта и по дате. Поле с датой привести к формату даты.

<details>
<summary>Решение</summary>

```
SELECT
	trip_no
	, date
	, price
	, ROUND(price::FLOAT/w * 100) as proportion
FROM
	(
	SELECT
		pit.trip_no
		, date::DATE
		, price
		, SUM(price) OVER(PARTITION BY pit.trip_no) AS w
	FROM price AS p
	JOIN pass_in_trip AS pit
		ON p.trip_no = pit.trip_no
	) AS t
ORDER BY
	trip_no
	, date
```

</details>

<details>
<summary>Ответ</summary>

| trip_no | date | price | proportion |
| ------------- | ------------- |  ------------- |  ------------- | 
|1100|37740|1600|100|
|1123|37716|1700|33|
|1123|37719|1700|33|
|1123|37719|1700|33|
|1124|37713|2500|100|
|1145|37716|2200|50|
|1145|37736|2200|50|
|1181|37712|2400|25|
|1181|37712|2400|25|
|1181|37712|2400|25|
|1181|37724|2400|25|
|1182|37724|3500|50|
|1182|37724|3500|50|
|1187|37725|2100|50|
|1187|37725|2100|50|
|1188|37712|1200|100|
|7771|38660|3700|17|
|7771|38663|3700|17|
|7771|38663|3700|17|
|7771|38665|3700|17|
|7771|38670|3700|17|
|7771|38672|3700|17|
|7772|38663|2300|20|
|7772|38663|2300|20|
|7772|38685|2300|20|
|7772|38685|2300|20|
|7772|38685|2300|20|
|7773|38663|2400|100|
|7778|38661|2700|100|
|8881|38664|3900|100|
|8882|38662|2800|50|
|8882|38669|2800|50|

</details>


#### Задание 11

Каждый первый день месяца скидка на все билеты 10%! Необходимо вывести номер полёта, дату в формате дата, и цену. Если цена меняется - её нужно пересчитать и привести к целому числу. Если цена не меняется - ничего пересчитывать не нужно.

В итоговом ответе оставить только номер путешествия, дату и цену.

<details>
<summary>Решение</summary>

```
SELECT
	pit.trip_no
	, date::DATE
	, CASE
		WHEN date_part('day', date) = 1 then (price * 0.9)::INT
		ELSE price
	end AS price
FROM price AS p
JOIN pass_in_trip AS pit
	ON p.trip_no = pit.trip_no
ORDER BY
	trip_no
	, date
```

</details>

<details>
<summary>Ответ</summary>

| trip_no | date | price |
| ------------- | ------------- |  ------------- |
|1100|37740|1600|
|1123|37716|1700|
|1123|37719|1700|
|1123|37719|1700|
|1124|37713|2500|
|1145|37716|2200|
|1145|37736|2200|
|1181|37712|2160|
|1181|37712|2160|
|1181|37712|2160|
|1181|37724|2400|
|1182|37724|3500|
|1182|37724|3500|
|1187|37725|2100|
|1187|37725|2100|
|1188|37712|1080|
|7771|38660|3700|
|7771|38663|3700|
|7771|38663|3700|
|7771|38665|3700|
|7771|38670|3700|
|7771|38672|3700|
|7772|38663|2300|
|7772|38663|2300|
|7772|38685|2300|
|7772|38685|2300|
|7772|38685|2300|
|7773|38663|2400|
|7778|38661|2700|
|8881|38664|3900|
|8882|38662|2800|
|8882|38669|2800|

</details>

#### Задание 12

Сколько всего денег за путешествия заплатил каждый пассажир за всё время? В итоговом ответе вывести имя и общую сумму денег, потраченных каждым пассажиром.

Поле с суммой назвать sum_price. Полученный результат отсортировать по сумме по убыванию.

<details>
<summary>Решение</summary>

```
SELECT
	name
	, SUM(price) AS sum_price
FROM price AS p
JOIN pass_in_trip AS pit
	ON p.trip_no = pit.trip_no
JOIN passenger as psg
	ON psg.id_psg = pit.id_psg
GROUP BY name
ORDER BY sum_price DESC
```

</details>


<details>
<summary>Ответ</summary>

| name | price |
| ------------- | ------------- |
|Mullah Omar|12700|
|Michael Caine|12500|
|Harrison Ford|11100|
|Jennifer Lopez|8100|
|Kurt Russell |7100|
|Bruce Willis |5700|
|Nikole Kidman|5700|
|Steve Martin |4700|
|Ray Liotta |4100|
|Kevin Costner|3900|
|Alan Rickman |3500|
|George Clooney|2500|
|Russell Crowe|2300|

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
