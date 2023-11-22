def counting_sort(nums):
    size = len(nums)
    output = [0] * size

    count = [0] * 10

    for i in range(0, size):
        count[nums[i]] += 1

    for i in range(1, 10):
        count[i] += count[i - 1]

    i = size - 1
    while i >= 0:
        output[count[nums[i]] - 1] = nums[i]
        count[nums[i]] -= 1
        i -= 1

    for i in range(0, size):
        nums[i] = output[i]

    return nums