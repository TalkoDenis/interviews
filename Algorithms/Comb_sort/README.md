### Сортировка расчёской

_Сортировка расчёской (comb sort)_ - улучшение сортировки пузырьком. Основная идея состоит в том, чтобы «устранить» элементы с небольшими значения в конце массива, которые замедляют работу алгоритма. Если при пузырьковой и шейкерной сортировках при переборе массива сравниваются соседние элементы, то при «расчёсывании» сначала берётся достаточно большое расстояние между сравниваемыми значениями, а потом оно сужается вплоть до минимального.

Первоначальный разрыв нужно выбирать не случайным образом, а с учётом специальной величины - фактора уменьшения, оптимальное значение которого равно 1,247. Сначала расстояние между элементами будет равняться размеру массива, поделённому на 1,247. На каждом последующем шаге расстояние будет снова делиться на фактор уменьшения, и так до окончания работы алгоритма.

#### Алгоритм

На первом шаге находится длина массива (например, массив состоит из 10 элементов), делится на 1,247 и округляется. После округления получилось число 8. Теперь проходится первый цикл пузырьковой сортировки, только сравниваются не 1 и 2, 2 и 3 элементы, а сразу 1 и 8, 2 и 9, 3 и 10. Это отправит самые большие числа, если они есть в начале, в самый конец. Всего на первом шаге будет три сравнения.

На втором шаге берётся число 8 из предыдущего этапа и снова делится на 1,247, получая число 6. Теперь снова проходится массив и сравниваются элементы: 1 и 6, 2 и 7, 3 и 8, 4 и 9, 5 и 10.

Уже получилось 5 перестановок и снова крупные числа оказались ближе к концу массива.

Таким образом уменьшается размер шага до тех пор, пока он не станет меньше единицы - к этому моменту массив будет полностью отсортирован.

Почему это лучше пузырьковой сортировки, ведь алгоритм выглядит сложнее и в конце мы всё равно сравниваем соседние элементы?

"Расчёска" лучше пузырьковой сортировки, потому что в ней намного меньше операций перестановки. Именно перестановка занимает основное время процессора. В самом худшем случае алгоритм сортировки расчёской будет работать так же, как и пузырьковая, а в среднем — алгоритм работает быстрее пузырьковой.


<details>
<summary>Реализация на Python</summary>

```

def comb_sort(nums):
    # Получаем длину массива
    l = len(nums)
    # Оптимальное число для вычисления шага сравнения
    factor = 1.247
    # Получаем точный шаг сравнения
    gap_factor = l / factor
    while gap_factor > 1:
        gap = round(gap_factor)
        for i in range(l - gap):
            j = i + gap
            if nums[i] > nums[j]:
                nums[i], nums[j] = nums[j], nums[i]
        gap_factor = gap_factor / factor
    return nums

```

</details>

<details>
<summary>Реализация на Ruby</summary>

```

def comb_sort(nums)
  # получаем длину массива
  l = nums.size
  # оптимальное число для вычисления шага сравнения
  factor = 1.247
  # получаем точный шаг сравнения
  gap_factor = l / factor
  # пока шаг больше единицы
  while gap_factor > 1
    gap = gap_factor.round
    (0..(l - gap - 1)).each do |i|
      j = i + gap
      if nums[i] > nums[j]
        nums[i], nums[j] = nums[j], nums[i]
      end
    end
    gap_factor = gap_factor / factor
  end
  return nums
end

```

</details>
