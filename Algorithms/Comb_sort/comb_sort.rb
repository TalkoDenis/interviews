def comb_sort(nums)
  # получаем длину массива
  l = nums.size
  # оптимальное число для вычисления шага сравнения
  factor = 1.247
  # получаем точный шаг сравнения
  gap_factor = l / factor
  # пока шаг больше единицы
  while gap_factor > 1
    gap = gap_factor.round
    (0..(l - gap - 1)).each do |i|
      j = i + gap
      if nums[i] > nums[j]
        nums[i], nums[j] = nums[j], nums[i]
      end
    end
    gap_factor = gap_factor / factor
  end
  return nums
end
