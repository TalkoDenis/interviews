def bubble_sort(nums)
    # swapped установлен в true, чтобы цикл запустился хотя бы один раз
    swapped = true
    # определяется размер списка
    nums_length = nums.size
    while swapped
        swapped = false
        (nums_length - 1).times do |i|
            if nums[i] > nums[i + 1]
                # Элементы меняются местами
                nums[i], nums[i + 1] = nums[i + 1], nums[i]
                # Устанавливаем swapped в True для следующей итерации
                swapped = true
            end
        end
    end
    return nums
end
