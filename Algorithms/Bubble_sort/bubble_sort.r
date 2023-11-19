bubble_sort <- function(nums) {
  # swapped установлен в TRUE, чтобы цикл запустился хотя бы один раз
  swapped <- TRUE
  
  while (swapped) {
    swapped <- FALSE
    
    for (i in 1:(length(nums) - 1)) {
      if (nums[i] > nums[i + 1]) {
        # Элементы меняются местами
        temp <- nums[i]
        nums[i] <- nums[i + 1]
        nums[i + 1] <- temp
        
        # Устанавливаем swapped в TRUE для следующей итерации
        swapped <- TRUE
      }
    }
  }
  
  return(nums)
}