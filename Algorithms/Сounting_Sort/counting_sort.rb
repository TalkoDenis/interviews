def counting_sort(nums)
    size = nums.length
    output = Array.new(size, 0)
  
    count = Array.new(10, 0)
  
    for i in 0...size
      count[nums[i]] += 1
    end
  
    for i in 1...10
      count[i] += count[i - 1]
    end
  
    i = size - 1
    while i >= 0
      output[count[nums[i]] - 1] = nums[i]
      count[nums[i]] -= 1
      i -= 1
    end
  
    for i in 0...size
      nums[i] = output[i]
    end
  
    nums
end  