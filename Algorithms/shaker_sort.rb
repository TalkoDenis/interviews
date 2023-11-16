def shaker_sort(nums) 
    # Определяем начальный (левый) и конечный (правый) элементы
    left = 0
    right = nums.size - 1
    while left <= right
        # Проходимся от левого до правого элемента с шагом один
        (left...right).each do |i|
            if nums[i] > nums[i + 1]
                nums[i], nums[i + 1] = nums[i + 1], nums[i]
            end
        right -= 1
        end
        # Проходимся от правого до левого элемента с шагом минус один!
        (right).downto(left).each do |i|
            if nums[i - 1] > nums[i]
                nums[i], nums[i - 1] = nums[i - 1], nums[i]
            end
        left += 1
        end
    end
    return nums
end