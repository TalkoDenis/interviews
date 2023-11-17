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

# исходный массив
nums = [3, 14, 1, 7, 9, 8, 11, 6, 4, 2]

# вызываем функцию сортировки
print(comb_sort(nums))
