### Пирамидальная сортировка

_Пирамидальная сортировка (сортировка кучей, HeapSort)_ - это метод сортировки сравнением, основанный на такой структуре данных как двоичная куча. Это такой же популярный алгоритм, как и сортировки вставками или выборкой. Алгоритм сегментирует список на две части: отсортированную и неотсортированную. Алгоритм преобразует второй сегмент списка в структуру данных «куча» (heap), чтобы можно было эффективно определить самый большой элемент.

#### Алгоритм

Сначала список преобразуется в Max Heap - бинарное дерево, где самый большой элемент является вершиной дерева. Затем этот элемент помещается в конец списка. После Max Heap перестраивается и снова новый наибольший элемент помещается уже перед последним элементом в списке.

Этот процесс построения кучи повторяется, пока все вершины дерева не будут удалены.

#### Время сортировки

В среднем время сортировки кучей составляет O(n log n), что значительно быстрее предыдущих алгоритмов.

<details>
<summary>Реализация на Python</summary>

```

def heapify(nums, heap_size, root_index):  
    # Индекс наибольшего элемента считаем корневым индексом
    largest = root_index
    left_child = (2 * root_index) + 1
    right_child = (2 * root_index) + 2

    # Если левый потомок корня - допустимый индекс, а элемент больше,
    # чем текущий наибольший, наибольший элемент обновляется
    if left_child < heap_size and nums[left_child] > nums[largest]:
        largest = left_child

    # То же самое для правого потомка корня
    if right_child < heap_size and nums[right_child] > nums[largest]:
        largest = right_child

    # Если наибольший элемент больше не корневой, они меняются местами
    if largest != root_index:
        nums[root_index], nums[largest] = nums[largest], nums[root_index]
        heapify(nums, heap_size, largest)

def heap_sort(nums):  
    n = len(nums)

    # Создаётся Max Heap из списка
    # Второй аргумент означает остановку алгоритма перед элементом -1, т.е.
    # перед первым элементом списка
    # 3-й аргумент означает повторный проход по списку в обратном направлении, 
    # уменьшая счётчик i на 1 
    for i in range(n, -1, -1):
        heapify(nums, n, i)

    # Корень Max Heap перемещается в конец списка
    for i in range(n - 1, 0, -1):
        nums[i], nums[0] = nums[0], nums[i]
        heapify(nums, i, 0)

    return nums

```

</details>

<details>
<summary>Реализация на Ruby</summary>

```

def heapify(nums, heap_size, root_index)
    largest = root_index
    left_child = 2 * root_index + 1
    right_child = 2 * root_index + 2
  
    if left_child < heap_size && nums[left_child] > nums[largest]
      largest = left_child
    end
  
    if right_child < heap_size && nums[right_child] > nums[largest]
      largest = right_child
    end
  
    if largest != root_index
      nums[root_index], nums[largest] = nums[largest], nums[root_index]
      heapify(nums, heap_size, largest)
    end
end
  
def heap_sort(nums)
    n = nums.length
  
    # Создаем Max Heap из списка
    (n - 1).downto(0) do |i|
      heapify(nums, n, i)
    end
  
    # Корень Max Heap перемещается в конец списка
    (n - 1).downto(1) do |i|
      nums[i], nums[0] = nums[0], nums[i]
      heapify(nums, i, 0)
    end
  
    nums
end  

```

</details>
