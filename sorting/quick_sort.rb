#worst: O(n^2)
#average: theta(n log(n))

def quick_sort(array)
  return array if array.length < 2
  pivot_index = array.length / 2
  pivot = array[pivot_index]
  equal = []
  left = []
  right = []
  array.each do |i|
    if i == pivot
      equal.push(i)
    elsif i < pivot
      left.push(i)
    else
      right.push(i)
    end
  end
  left = quick_sort(left)
  right = quick_sort(right)
  left + equal + right
end

p quick_sort(%w[i n s e r t i o n s o r t])
