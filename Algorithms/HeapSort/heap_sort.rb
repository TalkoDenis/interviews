def heapify(nums, heap_size, root_index)
    largest = root_index
    left_child = 2 * root_index + 1
    right_child = 2 * root_index + 2
  
    if left_child < heap_size && nums[left_child] > nums[largest]
      largest = left_child
    end
  
    if right_child < heap_size && nums[right_child] > nums[largest]
      largest = right_child
    end
  
    if largest != root_index
      nums[root_index], nums[largest] = nums[largest], nums[root_index]
      heapify(nums, heap_size, largest)
    end
end
  
def heap_sort(nums)
    n = nums.length
  
    # Создаем Max Heap из списка
    (n - 1).downto(0) do |i|
      heapify(nums, n, i)
    end
  
    # Корень Max Heap перемещается в конец списка
    (n - 1).downto(1) do |i|
      nums[i], nums[0] = nums[0], nums[i]
      heapify(nums, i, 0)
    end
  
    nums
end  