# Метод проверки упорядоченности массива
def sorted?(nums)
    length = nums.length
    (0..length - 2).each do |i|
      return false if nums[i] > nums[i + 1]
    end
    return true
end
  
# Перемешивание массива в случайном порядке
def random_permutation(nums)
    length = nums.length
    (0..length - 1).each do |i|
      rnd = rand(0..length - 1)
      # обмен элементов массива
      temp = nums[i]
      nums[i] = nums[rnd]
      nums[rnd] = temp
    end
end
  
# Случайная сортировка
def bogo_sort(nums)
    until sorted?(nums)
      random_permutation(nums)
    end
    nums
end