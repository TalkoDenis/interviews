### Практика

### Задания попроще

Тут скрипт для создания базы данных и дальнейшей работы. Обратите внимание, я всё написано на PostgreSQL!

Ещё одно важное замечание. Вопросы разделены на два вида: попроще и посложнее. Задания попроще включают в себя одну базу данных из нескольких таблиц, задания сложнее - пожохую, но немного более видоизменённую базу с большим количеством таблиц и данных.

Ниже есть скрипты для создания таблиц, загрузки данных и дальнейшего удаления таблиц. Тут собраны задания попроще. Это реальные задания, которые могут спрашивать на собеседованиях на позицию аналитик данных.

Скрипт и описание более сложных заданий будет отдельно.
  
<details>
<summary>Удаление таблиц (если ранее создали)</summary>

```
drop table pass_in_trip;
drop table trip;
drop table passenger;
drop table company;
drop table price;
```
</details>


<details>
<summary>Создание таблиц</summary>

```
CREATE TABLE Company (
	ID_comp int NOT NULL ,
	name char (10) NOT NULL 
)
;
```

```
CREATE TABLE Pass_in_trip (
	trip_no int NOT NULL ,
	date timestamp NOT NULL ,
	ID_psg int NOT NULL ,
	place char (10) NOT NULL 
)
;
```

```
CREATE TABLE Passenger (
	ID_psg int NOT NULL ,
	name char (20) NOT NULL 
)
;
```

```
CREATE TABLE Trip (
	trip_no int NOT NULL ,
	ID_comp int NOT NULL ,
	plane char (10) NOT NULL ,
	town_from char (25) NOT NULL ,
	town_to char (25) NOT NULL ,
	time_out timestamp NOT NULL ,
	time_in timestamp NOT NULL 
)
;
```

```
CREATE TABLE Price (
	trip_no int NOT NULL ,
	price int NOT NULL 
)
;
```

</details>


<details>
<summary>Загрузка данных в таблицы</summary>

```
-- Company
insert into Company values(1,'Don_avia  ');
insert into Company values(2,'Aeroflot  ');
insert into Company values(3,'Dale_avia ');
insert into Company values(4,'air_France');
insert into Company values(5,'British_AW');
```

```
-- Passenger 
insert into Passenger values(1,'Bruce Willis        ');
insert into Passenger values(2,'George Clooney      ');
insert into Passenger values(3,'Kevin Costner       ');
insert into Passenger values(4,'Donald Sutherland   ');
insert into Passenger values(5,'Jennifer Lopez      ');
insert into Passenger values(6,'Ray Liotta          ');
insert into Passenger values(7,'Samuel L. Jackson   ');
insert into Passenger values(8,'Nikole Kidman       ');
insert into Passenger values(9,'Alan Rickman        ');
insert into Passenger values(10,'Kurt Russell        ');
insert into Passenger values(11,'Harrison Ford       ');
insert into Passenger values(12,'Russell Crowe       ');
insert into Passenger values(13,'Steve Martin        ');
insert into Passenger values(14,'Michael Caine       ');
insert into Passenger values(15,'Angelina Jolie      ');
insert into Passenger values(16,'Mel Gibson          ');
insert into Passenger values(17,'Michael Douglas     ');
insert into Passenger values(18,'John Travolta       ');
insert into Passenger values(19,'Sylvester Stallone  ');
insert into Passenger values(20,'Tommy Lee Jones     ');
insert into Passenger values(21,'Catherine Zeta-Jones');
insert into Passenger values(22,'Antonio Banderas    ');
insert into Passenger values(23,'Kim Basinger        ');
insert into Passenger values(24,'Sam Neill           ');
insert into Passenger values(25,'Gary Oldman         ');
insert into Passenger values(26,'Clint Eastwood      ');
insert into Passenger values(27,'Brad Pitt           ');
insert into Passenger values(28,'Johnny Depp         ');
insert into Passenger values(29,'Pierce Brosnan      ');
insert into Passenger values(30,'Sean Connery        ');
insert into Passenger values(31,'Bruce Willis        ');
insert into Passenger values(37,'Mullah Omar         ');
```

```
-- Trip
insert into Trip values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','19000101 14:30:00.000','19000101 17:50:00.000');
insert into Trip values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','19000101 08:12:00.000','19000101 11:45:00.000');
insert into Trip values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','19000101 16:20:00.000','19000101 03:40:00.000');
insert into Trip values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','19000101 09:00:00.000','19000101 19:50:00.000');
insert into Trip values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','19000101 09:35:00.000','19000101 11:23:00.000');
insert into Trip values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','19000101 17:55:00.000','19000101 20:01:00.000');
insert into Trip values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','19000101 06:12:00.000','19000101 08:01:00.000');
insert into Trip values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','19000101 12:35:00.000','19000101 14:30:00.000');
insert into Trip values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','19000101 15:42:00.000','19000101 17:39:00.000');
insert into Trip values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','19000101 22:50:00.000','19000101 00:48:00.000');
insert into Trip values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','19000101 23:30:00.000','19000101 01:11:00.000');
insert into Trip values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','19000101 04:00:00.000','19000101 05:45:00.000');
insert into Trip values(7771,5,'Boeing    ','London                   ','Singapore                ','19000101 01:00:00.000','19000101 11:00:00.000');
insert into Trip values(7772,5,'Boeing    ','Singapore                ','London                   ','19000101 12:00:00.000','19000101 02:00:00.000');
insert into Trip values(7773,5,'Boeing    ','London                   ','Singapore                ','19000101 03:00:00.000','19000101 13:00:00.000');
insert into Trip values(7774,5,'Boeing    ','Singapore                ','London                   ','19000101 14:00:00.000','19000101 06:00:00.000');
insert into Trip values(7775,5,'Boeing    ','London                   ','Singapore                ','19000101 09:00:00.000','19000101 20:00:00.000');
insert into Trip values(7776,5,'Boeing    ','Singapore                ','London                   ','19000101 18:00:00.000','19000101 08:00:00.000');
insert into Trip values(7777,5,'Boeing    ','London                   ','Singapore                ','19000101 18:00:00.000','19000101 06:00:00.000');
insert into Trip values(7778,5,'Boeing    ','Singapore                ','London                   ','19000101 22:00:00.000','19000101 12:00:00.000');
insert into Trip values(8881,5,'Boeing    ','London                   ','Paris                    ','19000101 03:00:00.000','19000101 04:00:00.000');
insert into Trip values(8882,5,'Boeing    ','Paris                    ','London                   ','19000101 22:00:00.000','19000101 23:00:00.000');
```

```
-- Pass_in_trip 
insert into Pass_in_trip values(1100,'20030429 00:00:00.000',1,'1a        ');
insert into Pass_in_trip values(1123,'20030405 00:00:00.000',3,'2a        ');
insert into Pass_in_trip values(1123,'20030408 00:00:00.000',1,'4c        ');
insert into Pass_in_trip values(1123,'20030408 00:00:00.000',6,'4b        ');
insert into Pass_in_trip values(1124,'20030402 00:00:00.000',2,'2d        ');
insert into Pass_in_trip values(1145,'20030405 00:00:00.000',3,'2c        ');
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',1,'1a        ');
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',6,'1b        ');
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',8,'3c        ');
insert into Pass_in_trip values(1181,'20030413 00:00:00.000',5,'1b        ');
insert into Pass_in_trip values(1182,'20030413 00:00:00.000',5,'4b        ');
insert into Pass_in_trip values(1187,'20030414 00:00:00.000',8,'3a        ');
insert into Pass_in_trip values(1188,'20030401 00:00:00.000',8,'3a        ');
insert into Pass_in_trip values(1182,'20030413 00:00:00.000',9,'6d        ');
insert into Pass_in_trip values(1145,'20030425 00:00:00.000',5,'1d        ');
insert into Pass_in_trip values(1187,'20030414 00:00:00.000',10,'3d        ');
insert into Pass_in_trip values(8882,'20051106 00:00:00.000',37,'1a        ') ;
insert into Pass_in_trip values(7771,'20051107 00:00:00.000',37,'1c        ') ;
insert into Pass_in_trip values(7772,'20051107 00:00:00.000',37,'1a        ') ;
insert into Pass_in_trip values(8881,'20051108 00:00:00.000',37,'1d        ') ;
insert into Pass_in_trip values(7778,'20051105 00:00:00.000',10,'2a        ') ;
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',10,'3a        ');
insert into Pass_in_trip values(7771,'20051104 00:00:00.000',11,'4a        ');
insert into Pass_in_trip values(7771,'20051107 00:00:00.000',11,'1b        ');
insert into Pass_in_trip values(7771,'20051109 00:00:00.000',11,'5a        ');
insert into Pass_in_trip values(7772,'20051107 00:00:00.000',12,'1d        ');
insert into Pass_in_trip values(7773,'20051107 00:00:00.000',13,'2d        ');
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',13,'1b        ');
insert into Pass_in_trip values(8882,'20051113 00:00:00.000',14,'3d        ');
insert into Pass_in_trip values(7771,'20051114 00:00:00.000',14,'4d        ');
insert into Pass_in_trip values(7771,'20051116 00:00:00.000',14,'5d        ');
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',14,'1c        ');
```

```
-- Price
insert into Price values(1100,1600);
insert into Price values(1101,2100);
insert into Price values(1123,1700);
insert into Price values(1124,2500);
insert into Price values(1145,2200);
insert into Price values(1146,3600);
insert into Price values(1181,2400);
insert into Price values(1182,3500);
insert into Price values(1187,2100);
insert into Price values(1188,1200);
insert into Price values(1195,3200);
insert into Price values(1196,2400);
insert into Price values(7771,3700);
insert into Price values(7772,2300);
insert into Price values(7773,2400);
insert into Price values(7774,1700);
insert into Price values(7775,3800);
insert into Price values(7776,3100);
insert into Price values(7777,3000);
insert into Price values(7778,2700);
insert into Price values(8881,3900);
insert into Price values(8882,2800);
```

</details>


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

| plane |
| ------------- |
| Boeing |
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

| plane |
| ------------- |
| air_France |
| British_AW |

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

| name |
| ------------- |	
| Harrison Ford |
| Michael Caine |
| Mullah Omar |
| Steve Martin | 

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

| town_to |
| ------------- |	
| London |
| Paris |
| Rostov |
| Singapore |

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

| name  |
| ------------- |
| Bruce Willis |
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
