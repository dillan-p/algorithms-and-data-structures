#worst: O(log(n))

#ARRAY MUST BE SORTED BEFORE PERFORMING BINARY SEARCH

def binary_search(array, target)
  min = 0
  max = array.length - 1
  while min <= max
    mid = (min + max)/2 #must put min + max in brackets, else ruby runs it as: min + (max/2)
    if array[mid] > target
      max = mid - 1
    elsif array[mid] < target
      min = mid + 1
    else
      return mid
    end
  end
  false
end

p binary_search([1,2,3,4,5], 6)
