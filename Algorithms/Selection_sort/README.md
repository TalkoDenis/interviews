### Сортировка выборкой

_Сортировка выборкой (selection sort)_ - этот алгоритм сегментирует список на две части: отсортированную и неотсортированную. Наименьший элемент удаляется из второго списка и добавляется в первый.

#### Алгоритм

На практике не нужно создавать новый список для отсортированных элементов. В качестве него используется крайняя левая часть списка. Находится наименьший элемент и меняется с первым местами.

После того, как первый элемент списка отсортирован, находится наименьший элемент из оставшихся и меняем местами со вторым. Повторяется это до тех пор, пока не останется последний элемент в списке.

<details>
<summary>Реализация на Python</summary>

```

def selection_sort(nums):  
    for i in range(len(nums)):
        # По умолчанию первый элемент считается наименьшим
        lowest_value_index = i
        for j in range(i + 1, len(nums)):
            if nums[j] < nums[lowest_value_index]:
                lowest_value_index = j
        nums[i], nums[lowest_value_index] = nums[lowest_value_index], nums[i]
    return nums

```

</details>

<details>
<summary>Реализация на Ruby</summary>

```

def selection_sort(nums)
    nums.size.times do |i|
        # По умолчанию первый элемент считается наименьшим
        lowest_value_index = i
        (i + 1...nums.length).each do |j|
            if nums[j] < nums[lowest_value_index]
                lowest_value_index = j
            end
        end
        nums[i], nums[lowest_value_index] = nums[lowest_value_index], nums[i]
    end
    return nums
end

```

</details>
