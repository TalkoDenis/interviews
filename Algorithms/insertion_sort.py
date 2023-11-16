def insertion_sort(nums): 
    length = len(nums) 
    for i in range(1, length):
        key = nums[i]
        j = i
        while (j - 1 >= 0) and (nums[j - 1] > key):
            nums[j - 1], nums[j] = nums[j], nums[j - 1]
            j = j - 1
        nums[j] = key
    return nums