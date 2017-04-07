# worst: O(n^2)

def insertion_sort(array)
  (1...array.length).each do |i|
    j = i
    while j > 0 && array[j] < array[j - 1]
      array[j], array[j - 1] = array[j - 1], array[j]
      j = j - 1
    end
  end
  array
end

p insertion_sort(%w[i n s e r t i o n s o r t])
