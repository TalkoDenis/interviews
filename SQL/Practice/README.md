### Практика

Тут скрипт для создания базы данных и дальнейшей работы. Обратите внимание, я всё написано на PostgreSQL!
  
<details>
<summary>Удаление таблиц (если ранее создали)</summary>

</details>


<details>
<summary>Создание таблиц</summary>

</details>


<details>
<summary>Загрузка данных в таблицы</summary>

</details>


### Задания

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
