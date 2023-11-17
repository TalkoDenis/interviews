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