### Случайная сортировка

_Случайная сортировка (Bogosort)_ - один из самых неэффективных алгоритмов сортировки массивов. Рассматривать его стоит исключительно в учебных целях!

#### Алгоритм

Вначале массив проверяется на упорядоченность. Если элементы не отсортированы, то они перемешиваются случайным образом и снова проверяется, упорядочен ли массим. Операция повторяется до тех пор, пока массив не будет отсортирован. Когда-нибудь ведь должно сработать?

<details>
<summary>Реализация на Python</summary>

```
import random

# Метод проверки упорядоченности массива
def is_sorted(nums):
    length = len(nums)
    for i in range(0, length - 1):
        if(nums[i] > nums[i + 1]):
            return False
    return True

# Перемешивание массива в случайном порядке
def random_permutation(nums):
    length = len(nums)
    for i in range(0, length):
        rnd = random.randint(0, length - 1)
        # обмен элементов массива
        temp = nums[i]
        nums[i] = nums[rnd]
        nums[rnd] = temp

# Случайная сортировка
def bogo_sort(nums):
    while(not(is_sorted(nums))):
        random_permutation(nums)
    return nums
```

</details>

<details>
<summary>Реализация на Ruby</summary>

```

# Метод проверки упорядоченности массива
def sorted?(nums)
    length = nums.length
    (0..length - 2).each do |i|
      return false if nums[i] > nums[i + 1]
    end
    return true
end
  
# Перемешивание массива в случайном порядке
def random_permutation(nums)
    length = nums.length
    (0..length - 1).each do |i|
      rnd = rand(0..length - 1)
      # обмен элементов массива
      temp = nums[i]
      nums[i] = nums[rnd]
      nums[rnd] = temp
    end
end
  
# Случайная сортировка
def bogo_sort(nums)
    until sorted?(nums)
      random_permutation(nums)
    end
    nums
end

```

</details>
