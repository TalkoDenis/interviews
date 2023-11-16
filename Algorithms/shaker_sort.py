def shaker_sort(nums): 
    # Определяем начальный (левый) и конечный (правый) элементы
    left = 0
    right = len(nums) - 1
    while left <= right:
        # Проходимся от левого до правого элемента с шагом один
        for i in range(left, right, 1):
            if nums[i] > nums[i + 1]:
                nums[i], nums[i + 1] = nums[i + 1], nums[i]
        right -= 1
        # Проходимся от правого до левого элемента с шагом минус один!
        for i in range(right, left, -1):
            if nums[i - 1] > nums[i]:
                nums[i], nums[i - 1] = nums[i - 1], nums[i]
        left += 1
    return nums