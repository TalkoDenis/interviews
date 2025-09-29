### Pandas

#### 1. Как выполнить итерации по строкам в Pandas DataFrame?

Итерация (также известная как цикл) - посещение каждой строки в DataFrame по отдельности с выполнением определенной операции.

```
df = pd.DataFrame([[1, "A"], [2, "B"], [3, "C"]], columns = ["col1", "col2"])
df.head()
```

| id | col1 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |


<details>
<summary>Ответ</summary>
  
В Pandas можно выполнять итерацию тремя способами, используя **range(len(df))**, **iterrows()** и **itertuples()**.

```
print("Method 1:", end = " ")
for index in range(len(df)):
    print(df["col1"][index], end = " ")
```

Method 1: 1 2 3

```
print("\nMethod 2:", end = " ")
for index, row in df.iterrows():
    print(row["col1"], end = " ")
```
 
Method 2: 1 2 3

```
print("\nMethod 3:", end = " ")
for row in df.itertuples(): 
    print(row.col1, end = " ")
```
 
Method 3: 1 2 3 
</details>

#### 2. Как выбрать строки из DataFrame на основе значений столбцов?

Вопрос касается проблемы фильтрации **DataFrame** на основе условия. Предложите разные варианты.

```
df = pd.DataFrame([[1, "A"], [2, "B"], [3, "C"]], columns = ["col1", "col2"])
df.head()
```

| id | col1 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |

<details>
<summary>Ответ</summary>

##### Метод 1: фильтрация по одному столбцу.

```
df[df.col1>2]
```
| id | col1 | col2 |
|----|------|------|
| 2  | 3    | C    |

##### Метод 2: фильтрация по нескольким столбцам.

```
df[df.col1>1][df.col2 == "B"]
```
| id | col1 | col2 |
|----|------|------|
| 1  | 2    | B    |

##### Метод 3: фильтрация из списка.

```
df[df.col2.isin(["A", "B"])]
```
| id | col1 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |

##### Метод 4: использование df.query().

```
df.query('col1 > 2')
```
| id | col1 | col2 |
|----|------|------|
| 2  | 3    | C    |

Метод **isin()** (Метод 3) принимает список значений фильтрации. Метод **query()** (Метод 4) оценивает строковое выражение для фильтрации строк из **DataFrame**.
</details>

#### 3. Как переименовать столбцы в Pandas?

Задача состоит в том, чтобы изменить имена заголовков столбцов.
```
df = pd.DataFrame([[1, "A"], [2, "B"], [3, "C"]], columns = ["col1", "col2"])
df.head()
```

| id | col1 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |

<details>
<summary>Ответ</summary>
  
Можно изменить имя **col1** на **col3** с помощью метода **rename()** следующим образом:

```
df.rename(columns = {"col1":"col3"})
```

| id | col3 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |

В этом случае исходный **DataFrame** остается неизменным. Если не нужно создавать новый **DataFrame**, нужно использовать *inplace=True*:

```
df.rename(columns = {"col1":"col3"}, inplace = True)
df.head()
```

| id | col3 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |

При использовании метода **rename()** нужно создать мэппинг от **old-column-name** к **new-column-name** в виде словаря. Если имя столбца должно быть оставлено без изменений, его не нужно указывать в словаре.

</details>

#### 4. Как удалить столбец из Pandas DataFrame?

<details>
<summary>Ответ</summary>

Чтобы удалить один или несколько столбцов из **DataFrame**, можно использовать метод ***drop()*** и передать в виде списка столбцы, которые нужно удалить.

```
df = pd.DataFrame([[1, "A"], [2, "B"], [3, "C"]], columns = ["col1", "col2"])
df
```

| id | col1 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |

```
df.drop(columns = ["col1"])
```

```
df.drop(columns = ["col1"], inplace = True)
df
```
В качестве альтернативы, можно выбрать подмножество столбцов, которые нужно сохранить в конечном **DataFrame**.

```
df = df[["col2"]]
df
```

| id | col2 |
|----|------|
| 0  | A    |
| 1  | B    |
| 2  | C    |

Синтаксис метода ***drop()*** аналогичен синтаксису метода ***rename()***, с той лишь разницей, что аргумент **columns** принимает список столбцов, которые нужно удалить.
</details>

#### 5. Как получить количество строк в Pandas DataFrame?

Вопрос ориентирован на знание формы **Pandas DataFrame***. 

<details>
<summary>Ответ</summary>

```
df = pd.DataFrame([[1, "A"], [2, "B"], [3, "C"]], columns = ["col1", "col2"])
df
```

| id | col1 | col2 |
|----|------|------|
| 0  | 1    | A    |
| 1  | 2    | B    |
| 2  | 3    | C    |

Чтобы найти форму, используется атрибут ***shape*** для **DataFrame** следующим образом:

```
print("Shape of the DataFrame:", df.shape)
```
Shape of the DataFrame: (3, 2)

```
print("Number of rows:", df.shape[0])
```
Number of rows: 3

```
print("Number of columns:", df.shape[1])
```
Number of columns: 2

Атрибут ***shape*** возвращает кортеж **Python**. Первый элемент соответствует количеству строк, второй обозначает количество столбцов.

</details>

#### 6. Как выбрать несколько столбцов в Pandas DataFrame?

Суть данной задачи заключается в том, чтобы выбрать более одного столбца из DataFrame для дальнейшей обработки. Например, если исходный DataFrame состоит из трех столбцов, а именно col1, col2 и col3, как выбрать только col1 и col3?

df = pd.DataFrame([[1, "A", 1.1], [2, "B", 1.4], [3, "C", 1.9]], columns = ["col1", "col2", "col3"])
print(df)


   col1 col2  col3
0     1    A   1.1
1     2    B   1.4
2     3    C   1.9

<details>
<summary>Ответ</summary>

Это можно сделать двумя способами:

## Method 1: select the required columns

df_filtered = df[["col1", "col3"]]
print(df_filtered)

## Method 2: Using column indexes in iloc[]
df_filtered = df.iloc[:, [0,2]]
print(df_filtered)


   col1  col3
0     1   1.1
1     2   1.4
2     3   1.9
   col1  col3
0     1   1.1
1     2   1.4
2     3   1.9
Метод 1: выберите требуемые столбцы.
Метод 2: используйте индексы столбцов в iloc[].
Список [0,2] в iloc интерпретируется как столбцы, расположенные под 0-м (col1) и 2-м (col3) индексами.
</details>

#### 7. Как изменить порядок столбцов DataFrame?

Изменение порядка столбцов в DataFrame означает перестановку столбцов без изменения их количества (или формы DataFrame).

Рассмотрим приведенный ниже DataFrame. Задача состоит в том, чтобы расположить столбцы в порядке col1-col2-col3.

df = pd.DataFrame([[1, "A", 1.1], [2, "B", 1.4], [3, "C", 1.9]], 
                  columns = ["col2", "col3", "col1"])
print(df)


   col2 col3  col1
0     1    A   1.1
1     2    B   1.4
2     3    C   1.9

<details>
<summary>Ответ</summary>

Это можно сделать двумя способами:

## Method 1: select all the columns in order

df_new = df[["col1", "col2", "col3"]]
print(df_new)

## Method 2: Using all column indexes in iloc[]
df_new = df.iloc[:, [2,0,1]]
print(df_new)


   col1  col2 col3
0   1.1     1    A
1   1.4     2    B
2   1.9     3    C
   col1  col2 col3
0   1.1     1    A
1   1.4     2    B
2   1.9     3    C
Метод 1: выберите все столбцы по порядку.
Метод 2: используйте все индексы столбцов в iloc[].
Список [2,0,1] в iloc интерпретируется как столбцы, расположенные под 2-м (col1), 0-м (col2) и 1-м (col3) индексами.
</details>

#### 8. Как изменить тип столбца в Pandas?

Цель этого вопроса — узнать, как изменить тип данных столбца. Рассмотрим приведенный ниже DataFrame, в котором col1 содержит целочисленные значения в виде строк.

df = pd.DataFrame([["1", "A"], ["2", "B"], [3, "C"]], 
                  columns = ["col1", "col2"])
print(df)

print("Data Type of col1:", df.col1.dtype)


  col1 col2
0    1    A
1    2    B
2    3    C
Data Type of col1: object
Текущий тип данных col1 — это object (то же самое, что и string). Задача состоит в том, чтобы изменить тип данных col1 со string на integer.

<details>
<summary>Ответ</summary>

Изменить тип данных можно следующим образом:

df["new_col1"] = df["col1"].astype(int)

print(df)

print("Data Type of new_col1:", df.new_col1.dtype)


  col1 col2  new_col1
0    1    A         1
1    2    B         2
2    3    C         3
Data Type of new_col1: int64
Чтобы не создавать столбец, можно хранить новые значения в том же столбце:

df["col1"] = df["col1"].astype(int)

print(df)

print("Data Type of col1:", df.col1.dtype)


   col1 col2  new_col1
0     1    A         1
1     2    B         2
2     3    C         3
Data Type of col1: int64
При использовании метода astype() необходимо убедиться в том, что преобразование исходного типа данных в целевой выполнимо. Например, нельзя преобразовать столбец string алфавитов в тип данных integer (целочисленный) или float (плавающий).
</details>

#### 9. Как получить список из заголовков столбцов Pandas DataFrame?

Задача состоит в том, чтобы получить названия всех столбцов в DataFrame в виде списка. Рассмотрим приведенный ниже DataFrame:

df = pd.DataFrame([[1, "A", 1.1], [2, "B", 1.4], [3, "C", 1.9]], 
                  columns = ["col1", "col2", "col3"])
print(df)


   col1 col2  col3
0     1    A   1.1
1     2    B   1.4
2     3    C   1.9

<details>
<summary>Ответ</summary>
  
Чтобы получить список столбцов, используйте атрибут columns, как показано ниже:

print("All column names:", df.columns)

print("Type of df.columns: ", type(df.columns))


All column names: Index(['col1', 'col2', 'col3'], dtype='object')
Type of df.columns:  <class 'pandas.core.indexes.base.Index'>
Вышеуказанное возвращает столбец как объект Index. Чтобы получить его в виде списка, приведите полученные результаты к списку:

list(df.columns)


['col1', 'col2', 'col3']
</details>

#### 10. Как создать Pandas Dataframe путем добавления одной строки за раз?

Задача в том, чтобы добавлять одну строку за раз к изначально пустому DataFrame. Есть пустой **DataFrame** и список списков **data**, где каждый отдельный подсписок будет добавлен в **DataFrame** в виде строки.

```
df = pd.DataFrame(columns = ["col1", "col2", "col3"])
df.head()

data = [[1, "A", 1.1], [2, "B", 1.4], [3, "C", 1.9]]

Empty DataFrame
Columns: [col1, col2, col3]
Index: []
```

<details>
<summary>Ответ</summary>
Чтобы добавлять по одной строке за раз, нужно выполнить итерацию по списку data и добавить новую строку следующим образом:

```
for i in data:
    df.loc[df.shape[0]] = i

df.head()
```

| id | col1 | col2 | col3 |
|----|------|------|------|
| 0 | 1 | A | 1.1 |
| 1 | 2 | B | 1.4 |
| 2 | 3 | C | 1.9 |

Первый элемент кортежа, возвращаемого атрибутом **shape**, обозначает количество строк в **DataFrame**. Поэтому каждая новая строка, добавленная в **DataFrame**, обеспечивает создание нового индекса для следующей строки.

</details>
