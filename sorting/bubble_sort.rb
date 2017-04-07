#worst: O(n^2)

def bubble_sort(array)
  (0...array.length).each do |i|
    (1...array.length).each do |j| #can also do (array.length-1).downto(1)
      if array[j] < array[j - 1]
        array[j], array[j - 1] = array[j - 1], array[j]
      end
    end
  end
  array
end

p bubble_sort(%w[i n s e r t i o n s o r t])
