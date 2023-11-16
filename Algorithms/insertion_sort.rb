def insertion_sort(nums) 
    length = nums.size 
    length.times do |i|
        key = nums[i]
        j = i
        while (j - 1 >= 0) and (nums[j - 1] > key)
            nums[j - 1], nums[j] = nums[j], nums[j - 1]
            j = j - 1
        end
        nums[j] = key
    end
    return nums
end