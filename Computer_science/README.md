Свалка материалов


#### Структура данных
#### Что такое куча

Это зависит от содержимого.

В программировании есть два разных понятия, которые обозначаются одним и тем же словом «куча». Одно про выделение памяти, второе — про организацию данных. Разберём оба и закроем этот вопрос.

Куча и работа с памятью
Каждая запущенная программа использует собственную область оперативной памяти. Эта область делится на несколько частей: в одной хранятся данные, в другой — сам код программы, в третьей — константы. Ещё в эту область входят стек вызовов и куча. Про стек вызовов мы уже рассказывали в отдельной статье, теперь поговорим про кучу.

В отличие от стека, который строго упорядочен и все элементы там идут друг за другом, данные в куче могут храниться как угодно. Технически куча — это область памяти, которую компьютер выделяет программе и говорит: вот тебе свободная память для переменных, делай с ней что хочешь.

То, как программист распорядится этой памятью и каким образом будет с ней работать, влияет на быстродействие и работоспособность всей программы.


Аналогия со стройплощадкой
Представьте, что мы строим дом, а куча — это огромная площадка для хранения стройматериалов. Площадка может быть большой, но она не безграничная, поэтому важно как-то по-умному ей пользоваться. Например:

На стройке: мы выгрузили кирпич на один участок, использовали этот кирпич. Теперь нужно сказать, что этот участок можно снова использовать под стройматериалы. Новый кирпич можно разгрузить сюда же, а не искать новое место на площадке.

В программе: мы выделили память для переменной, использовали переменную, она больше не нужна. Можно сказать «Эта память свободна» и использовать её снова.

На стройке: мы храним определённый вид труб на палете № 53. Мы говорим крановщику: «Поднимайте на этаж то, что лежит на палете 53». Если мы ошибёмся с номером, то крановщик поднимет на этаж не те трубы.

В программе: в некоторых языках мы можем обратиться к куче напрямую через специальный указатель. Если мы ошиблись и сказали обратиться не к тому участку памяти, программа заберёт не те данные, а дальше будет ошибка.

👉 Прямой доступ к памяти есть не во всех языках программирования. Многие компиляторы и интерпретаторы ставят между программистом и памятью своеобразного администратора — диспетчера памяти. Он сам решает, какие переменные нужны, а какие нет; когда чистить память; сколько памяти на что выделить.

С одной стороны, это удобно: программист просто говорит «храни данные». А где они будут храниться и как их получить — это вопрос другой системы.

С другой стороны, автоматические диспетчеры памяти бывают менее эффективными, чем если управлять памятью вручную. Поэтому драйвера или софт для высоконагруженных систем чаще пишут в «ручном режиме».


Куча и организация данных
Второй вид кучи в программировании — это организация данных.

Куча — это такой вид дерева, у которого есть одно важное свойство:

если узел A — это родитель узла B, то ключ узла A больше ключа узла B (или равен ему).


У кучи нет ограничений на число потомков у каждого родителя, но на практике чаще всего используются бинарные кучи. Бинарные — значит, у каждого родителя может быть не больше двух потомков.

Для чего нужны кучи данных
Так как данные в куче упорядочены заранее понятным образом, то их можно использовать для быстрого нахождения нужного элемента или оптимальной последовательности действий, например:

для пирамидальной сортировки большого количества данных, когда объём требуемой памяти не зависит от размера массива, который мы сортируем;
для нахождения самого быстрого пути из точки A в точку B, когда мы знаем промежуточные расстояния между ними и точками по пути;
для поиска нужного элемента по каким-то критериям за минимальное время;
для вычисления оптимальной последовательности действий, если мы знаем параметры и условия для каждого действия.
Зачем это знать
Если вы просто пишете веб-приложения на JS — в принципе, это знать не нужно. Вы не можете из JS напрямую управлять памятью, а для простых задач вам вряд ли придётся часто обходить деревья и делать сложные сортировки.

Понимание структур данных нужно для глубокой экспертной работы с софтом. Это как понимание принципов работы механизма внутреннего сгорания. Вам необязательно в этом разбираться, если вы просто хотите водить автомобиль, но обязательно — если хотите собирать гоночные болиды.

---

Стек — что это такое?
Большое число задач, связанных с обработкой информации, поддаются типизированному решению. В результате совсем неудивительно, что многие из них решаются с помощью специально придуманных методов, терминов и описаний. Среди них нередко можно услышать и такое слово, как стек (стэк). Хоть и звучит этот термин, на первый взгляд, странно и даже сложно, всё намного проще, чем кажется. 

Итак, стек — это метод представления однотипных данных в порядке LIFO (Last In — First Out, то бишь, «первый вошел — последний вышел»). Некоторые ассоциируют стек с оружейным магазином для патронов, так как принцип работы схож, и первый вставленный в магазин патрон будет использоваться в последнюю очередь (у термина стек бывают и другие значения, поэтому, если речь идёт не об информационных технологиях, то смысл лучше уточнить). 

Стек и простой жизненный пример
Представьте, что на столе в коробке лежит стопка бумажных листов. Чтобы получить доступ к самому нижнему листу, вам нужно достать самый первый лист, потом второй и так далее, пока не доберётесь до последнего. По схожему принципу и устроен стек: чтобы последний элемент стека стал верхним, нужно сначала вытащить все остальные.
1stack-20219-ef97b7.jpg

Стек и особенности его работы
Перейдя к компьютерной терминологии, скажем, что стек — это область оперативной памяти, создаваемая для каждого потока. И последний добавленный в стек кусочек памяти и будет первым в очереди, то есть первым на вывод из стека. И каждый раз, когда функцией объявляется переменная, она, прежде всего, добавляется в стек. А когда данная переменная пропадает из нашей области видимости (к примеру, функция заканчивается), эта самая переменная автоматически удаляется из стека. При этом если стековая переменная освобождается, то и область памяти, в свою очередь, становится доступной и свободной для других стековых переменных. 

Благодаря природе, которую имеет стек, управление памятью становится весьма простым и логичным для выполнения на центральном процессоре. Это повышает скорость и быстродействие ЦП, и в особенности такое происходит потому, что время цикла обновления байта весьма незначительно (данный байт, скорее всего, привязан к кэшу центрального процессора). 

Тем не менее у данной довольно строгой формы управления имеются и свои недостатки. Например, размер стека — это величина фиксированная, в результате чего при превышении лимита памяти, выделенной на стеке, произойдёт переполнение стека. Как правило, размер задаётся во время создания потока, плюс у каждой переменной имеется максимальный размер, который зависит от типа данных. Всё это позволяет ограничивать размеры некоторых переменных (допустим, целочисленных).

Кроме того, это вынуждает объявлять размер более сложных типов данных (к примеру, массивов) заранее, так как стек не позволит потом изменить его. Вдобавок ко всему, переменные, которые расположены на стеке, являются всегда локальными. 

Для чего нужен стек?
Главное предназначение стека — решение типовых задач, предусматривающих поддержку последовательности состояний или связанных с инверсионным представлением данных. В компьютерной отрасли стек применяется в аппаратных устройствах (например, в центральном процессоре, как уже было упомянуто выше). 

Практически каждый, кто занимался программированием, знает, что без стека невозможна рекурсия, так как при любом повторном входе в функцию требуется сохранение текущего состояния на вершине, причём при каждом выходе из функции, нужно быстро восстанавливать это состояние (как раз наша последовательность LIFO). 

Если же копнуть глубже, то можно сказать, что, по сути, весь подход к запуску и выполнению приложений устроен на принципах стека. Не секрет, что прежде чем каждая следующая программа, запущенная из основной, будет выполняться, состояние предыдущей занесётся в стек, чтобы, когда следующая запущенная подпрограмма закончит выполняться, предыдущее приложение продолжило работу с места остановки. 

Стеки и операции стека
Если говорить об основных операциях, то стек имеет таковых две:
1. Push — ни что иное, как добавление элемента непосредственно в вершину стека.
2. Pop — извлечение из стека верхнего элемента. 

Также, используя стек, иногда выполняют чтение верхнего элемента, не выполняя его извлечение. Для этого предназначена операция peek. 

Как организуется стек?
Когда программисты организуют или реализуют стек, они применяют два варианта:
1. Используя массив и переменную, указывающую на ячейку вершины стека.
2. Используя связанные списки. 

У этих двух вариантов реализации стека есть и плюсы, и минусы. К примеру, связанные списки считаются более безопасными в плане применения, ведь каждый добавляемый элемент располагается в динамически созданной структуре (раз нет проблем с числом элементов, значит, отсутствуют дырки в безопасности, позволяющие свободно перемещаться в памяти программного приложения). Однако с точки зрения хранения и скорости применения связанные списки не столь эффективны, так как, во-первых, требуют дополнительного места для хранения указателей, во-вторых, разбросаны в памяти и не расположены друг за другом, если сравнивать с массивами. 

Подытожим: стек позволяет управлять памятью более эффективно. Однако помните, что если вам потребуется использовать глобальные переменные либо динамические структуры данных, то лучше обратить своё внимание на кучу. 



#### Что такое стек

Стек — это одна из структур данных. Структура данных — это то, как хранятся данные: например, связанные списки, деревья, очереди, множества, хеш-таблицы, карты и даже кучи (heap).

Как устроен стек
Стек хранит последовательность данных. Связаны данные так: каждый элемент указывает на тот, который нужно использовать следующим. Это линейная связь — данные идут друг за другом и нужно брать их по очереди. Из середины стека брать нельзя.

👉 Главный принцип работы стека — данные, которые попали в стек недавно, используются первыми. Чем раньше попал — тем позже используется. После использования элемент стека исчезает, и верхним становится следующий элемент.


Классический способ объяснения принципов стека звучит так: представьте, что вы моете посуду и складываете одинаковые чистые тарелки стопкой друг на друга. Каждая новая тарелка — это элемент стека, а вы просто добавляете их по одной в стек.

Когда кому-то понадобится тарелка, он не будет брать её снизу или из середины — он возьмёт первую сверху, потом следующую и так далее.

🤔 Есть структура данных, похожая на стек, — называется очередь, или queue. Если в стеке кто последний пришёл, того первым заберут, то в очереди наоборот: кто раньше пришёл, тот раньше ушёл. Можно представить очередь в магазине: кто раньше её занял, тот первый дошёл до кассы. Очередь — это тоже линейный набор данных, но обрабатывается по-другому.

Стек вызовов
В программировании есть два вида стека — стек вызовов и стек данных.

Когда в программе есть подпрограммы — процедуры и функции, — то компьютеру нужно помнить, где он прервался в основном коде, чтобы выполнить подпрограмму. После выполнения он должен вернуться обратно и продолжить выполнять основной код. При этом если подпрограмма возвращает какие-то данные, то их тоже нужно запомнить и передать в основной код.

Чтобы это реализовать, компьютер использует стек вызовов — специальную область памяти, где хранит данные о точках перехода между фрагментами кода.

Допустим, у нас есть программа, внутри которой есть три функции, причём одна из них внутри вызывает другую.


Программа запускается, потом идёт вызов синей функции. Она выполняется, и программа продолжает с того места, где остановилась. Потом выполняется зелёная функция, которая вызывает красную. Пока красная не закончит работу, все остальные ждут. Как только красная закончилась — продолжается зелёная, а после её окончания программа продолжает свою работу с того же места.


Программа дошла до синей функции, сохранила точку, куда ей вернуться после того, как закончится функция, и если функция вернёт какие-то данные, то программа тоже их получит. Когда синяя функция закончится и программа получит верхний элемент стека, он автоматически исчезнет. Стек снова пустой.


При вызове красной функции в стек помещается новый элемент с информацией о данных, точке возврата и указанием на следующий элемент. Это значит, что когда красная функция закончит работу, то компьютер возьмёт из стека адрес возврата и вернёт управление снова зелёной функции, а красный элемент исчезнет. Когда и зелёная закончит работу, то компьютер из стека возьмёт новый адрес возврата и продолжит работу со старого места.

Переполнение стека


Почти всегда стек вызовов хранится в оперативной памяти и имеет определённый размер. Если у вас будет много вложенных вызовов или рекурсия с очень большой глубиной вложенности, то может случиться такая ситуация:Что такое рекурсия

рекурсия всё работает и работает;
при каждом новом витке рекурсии в стек добавляются новый элемент;
когда элементов будет слишком много, память закончится, новые элементы некуда будет складывать и произойдёт переполнение стека.
Переполнение — это плохо: данные могут залезать в чужую область памяти и записывать себя вместо прежних данных. Это может привести к сбою в работе других программ или самого компьютера. Ещё таким образом можно внедрить в оперативную память вредоносный код: если программа плохо работает со стеком, можно специально вызвать переполнение и записать в память что-нибудь вредоносное.

Стек данных
Стек данных очень похож на стек вызовов: по сути, это одна большая переменная, похожая на список или массив. Его чаще всего используют для работы с другими сложными типами данных: например, быстрого обхода деревьев, поиска всех возможных маршрутов по графу, — и для анализа разветвлённых однотипных данных.

Стек данных работает по такому же принципу, как и стек вызовов — элемент, который добавили последним, должен использоваться первым.


https://thecode.media/stack/


---


Стек и куча
Куча — хранилище памяти, расположенное в ОЗУ. Оно допускает динамическое выделение памяти и работает не так, как стек. По сути, речь идёт о простом складе для ваших переменных. Когда вы выделяете здесь участок памяти для хранения, к ней можно обращаться как в потоке, так и во всём приложении в целом (именно так и определяются переменные глобального типа). По завершении работы приложения все выделенные участки освобождаются.

Размер кучи задаётся во время запуска приложения, однако, в отличие от того, как работает стек, в куче размер ограничен только физически, что позволяет создавать переменные динамического типа. 

Если сравнивать, опять же, с тем, как работает стек, то куча функционирует медленнее, т. к. переменные разбросаны по памяти, а не находятся вверху стека. Тем не менее данный факт не уменьшает важности кучи, и если вам надо работать с глобальными либо динамическими переменными, она больше подходит. Однако управлять памятью тогда должен программист либо сборщик мусора.


#### Что такое рекурсия

Это дом, который построил Джек.

Рекурсия — важный элемент в математике и программировании. С её помощью можно упаковывать большие и сложные конструкции в маленькие и простые, а потом разворачивать обратно, когда нужно. Давайте выясним, как она устроена.

Дом, который построил Джек
Чтобы было понятнее, что такое рекурсия, возьмём стихотворение Самуила Маршака «Дом, который построил Джек»:

Вот дом,
Который построил Джек.

А это пшеница,
Которая в тёмном чулане хранится В доме, Который построил Джек.

А это весёлая птица-синица,
Которая часто ворует пшеницу, Которая в тёмном чулане хранится В доме, Который построил Джек.

Вот кот,
Который пугает и ловит синицу, Которая часто ворует пшеницу, Которая в тёмном чулане хранится В доме, Который построил Джек.

Вот пёс без хвоста,
Который за шиворот треплет кота, Который пугает и ловит синицу, Которая часто ворует пшеницу, Которая в тёмном чулане хранится В доме, Который построил Джек. …

Смотрите, что в нём интересного: каждая часть стихотворения состоит из нового начала и точного повторения того, что уже было до этого. Сначала у нас был только дом, который построил Джек — это нулевой уровень рекурсии, или вложенности.

Нулевой уровень:

Вот дом,
Который построил Джек.

Обозначим его за [0] и дальше будем увеличивать это число для каждого уровня. Следите за уровнями.

Первый уровень:

А это пшеница,
Которая в тёмном чулане хранится [0]

Чтобы получить полноценное продолжение, нам нужно взять предыдущий уровень и подставить его сюда:

А это пшеница,
Которая в тёмном чулане хранится В доме,
Который построил Джек.

Второй уровень:

А это весёлая птица-синица,
Которая часто ворует пшеницу, [1]

Если мы будем разворачивать стих, то на первом проходе получим такое:

А это весёлая птица-синица,
Которая часто ворует пшеницу, Которая в тёмном чулане хранится
[0]

А на втором у нас уже появится полноценный стих:

А это весёлая птица-синица,
Которая часто ворует пшеницу, Которая в тёмном чулане хранится
В доме,
Который построил Джек.

👉 Общее правило такое: когда есть рекурсия, её последовательно разворачивают на каждом шаге, пока не дойдут до нулевого уровня. Как только дошли — всё готово, рекурсия сделала своё дело. До этого момента она вызывает сама себя с новыми параметрами.


Рекурсия в программировании


Допустим, нам нужно посчитать сумму всех чисел от 1 до какого-то числа. Можно это сделать в цикле, а можно сделать универсальную функцию с рекурсией. Ей будет достаточно указать на входе число, до которого нужно всё посчитать, а она сама сделает всё остальное.

Сначала запишем это на JavaScript, а потом разберёмся с тем, как работает эта магия:

```
function rec(x) {
  if (x == 1) { return (1) }
  else {
    return x + rec(x - 1);
  }
}
rec(10);
```

Первая строчка — объявление функции function rec(x). Здесь всё как обычно — указываем название и говорим, что на вход будет поступать какая-то переменная, с которой можно работать.

Затем мы организуем нулевой уровень — тот, где рекурсия начинается: if (x == 1) {return(1)}. Он говорит нам: если на вход поступит единица, то возвращаем единицу. Это логично — сумма всех чисел от 1 до 1 равна единице. Это как дом, который построил Джек — всё в итоге сведётся к этому.

А дальше идёт самое интересное — если мы не дошли до единицы, то мы берём значение x и складываем его с результатом этой же функции, но от предыдущего значения. Если мы, например, считаем rec (10), то эта команда сделает так:

Проверит, дошли ли до единицы.
Если не дошли — сложит 10 и значение rec(9).
Для этого она проверит, дошли ли до единицы.
Если не дошли — сложит 9 и значение rec(8).
Для этого она проверит…
…
Ура, мы дошли до единицы и возвращаем единицу обратно.
К этому моменту рекурсия уже дошла до команды 2 + rec(1). Она получает в ответ единицу, складывает 2 и 1 и возвращает результат на уровень выше.
На уровне выше была команда 3 + rec(2). Она получает в ответ 3, складывает 3 и 3 и возвращает результат на уровень выше.
…
На последнем уровне была команда 10 + rec(9). Она получает от предыдущего уровня результат 45, складывает 10 и 45 и получает результат 55.
Ура, рекурсия закончилась.
Попробуйте сами вставить код в консоль и посмотрите на результат.

Особенности рекурсии
Так как рекурсия — это программа, которая вызывает саму себя, то при неправильном подходе рекурсия может использовать очень много памяти и машинных ресурсов. Чем глубже уровень рекурсии — тем больше ресурсов ей нужно.

Иногда программист увлекается рекурсией и забывает прописать выход из неё. В результате рекурсия бесконечно углубляется саму в себя, забирает в себя все ресурсы и программа падает. Говорят, что так образуются чёрные дыры, в которых всё исчезает.

Бывают моменты, когда рекурсия — это единственный способ выполнить нужную задачу. Например, при парсинге HTML-кода или для построения дерева зависимостей.






