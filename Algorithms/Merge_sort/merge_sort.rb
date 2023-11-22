def merge(left_list, right_list)
    sorted_list = []
    left_list_index = right_list_index = 0
  
    # Длина списков часто используется, поэтому для удобства создадются переменные
    left_list_length, right_list_length = left_list.length, right_list.length
  
    (left_list_length + right_list_length).times do
      if left_list_index < left_list_length && right_list_index < right_list_length
        # Первые элементы в начале каждого списка сравниваются между собой
        # Если первый элемент левого подсписка меньше, он добавляется
        # в отсортированный массив
        if left_list[left_list_index] <= right_list[right_list_index]
          sorted_list << left_list[left_list_index]
          left_list_index += 1
        # Если первый элемент правого подсписка меньше, он добавляется
        # в отсортированный массив
        else
          sorted_list << right_list[right_list_index]
          right_list_index += 1
        end

      # Если достигнут конец левого списка, элементы правого списка
      # добавляются в конец результирующего списка  
      elsif left_list_index == left_list_length
        sorted_list << right_list[right_list_index]
        right_list_index += 1

      # Если достигнут конец правого списка, элементы левого списка
      # добавляются в отсортированный массив  
      elsif right_list_index == right_list_length
        sorted_list << left_list[left_list_index]
        left_list_index += 1
      end
    end
  
    sorted_list
end
  
def merge_sort(nums)
    # Возвращается список, если он состоит из одного элемента
    return nums if nums.length <= 1

    # Для того чтобы найти середину списка, используется деление без остатка
    # Индексы должны быть целочисленные
    mid = nums.length / 2
    
    # Сортировка и объединение подсписков
    left_list = merge_sort(nums[0...mid])
    right_list = merge_sort(nums[mid..])
  
    # Объединение отсортированных списков в результирующий список
    merge(left_list, right_list)
end