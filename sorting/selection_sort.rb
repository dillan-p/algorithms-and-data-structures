#worst: O(n^2)

def selection_sort(array)
  (0...array.length).each do |i|
    min_index = i
    (i+1...array.length).each do |j|
      if array[j] < array[min_index]
        min_index = j
      end
    end
    array[i], array[min_index] = array[min_index], array[i]
  end
  array
end

p selection_sort(%w[i n s e r t i o n s o r t])
