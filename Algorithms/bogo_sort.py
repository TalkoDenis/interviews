import random

# Метод проверки упорядоченности массива
def is_sorted(nums):
    length = len(nums)
    for i in range(0, length - 1):
        if(nums[i] > nums[i + 1]):
            return False
    return True

# Перемешивание массива в случайном порядке
def random_permutation(nums):
    length = len(nums)
    for i in range(0, length):
        rnd = random.randint(0, length - 1)
        # обмен элементов массива
        temp = nums[i]
        nums[i] = nums[rnd]
        nums[rnd] = temp

# Случайная сортировка
def bogo_sort(nums):
    while(not(is_sorted(nums))):
        random_permutation(nums)
    return nums