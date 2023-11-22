def merge(left_list, right_list):  
    sorted_list = []
    left_list_index = right_list_index = 0

    # Длина списков часто используется, поэтому для удобства создадются переменные
    left_list_length, right_list_length = len(left_list), len(right_list)

    for _ in range(left_list_length + right_list_length):
        if left_list_index < left_list_length and right_list_index < right_list_length:
            # Первые элементы в начале каждого списка сравниваются между собой
            # Если первый элемент левого подсписка меньше, он добавляется
            # в отсортированный массив
            if left_list[left_list_index] <= right_list[right_list_index]:
                sorted_list.append(left_list[left_list_index])
                left_list_index += 1
            # Если первый элемент правого подсписка меньше, он добавляется
            # в отсортированный массив
            else:
                sorted_list.append(right_list[right_list_index])
                right_list_index += 1

        # Если достигнут конец левого списка, элементы правого списка
        # добавляются в конец результирующего списка
        elif left_list_index == left_list_length:
            sorted_list.append(right_list[right_list_index])
            right_list_index += 1
        # Если достигнут конец правого списка, элементы левого списка
        # добавляются в отсортированный массив
        elif right_list_index == right_list_length:
            sorted_list.append(left_list[left_list_index])
            left_list_index += 1

    return sorted_list

def merge_sort(nums):  
    # Возвращается список, если он состоит из одного элемента
    if len(nums) <= 1:
        return nums

    # Для того чтобы найти середину списка, используется деление без остатка
    # Индексы должны быть целочисленные
    mid = len(nums) // 2

    # Сортировка и объединение подсписков
    left_list = merge_sort(nums[:mid])
    right_list = merge_sort(nums[mid:])

    # Объединение отсортированных списков в результирующий список
    return merge(left_list, right_list)