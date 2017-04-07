#worst: O(n log(n))

def merge_sort(array)
  if array.length == 1
    return array
  else
    mid = array.length/2
    left = array[0...mid]
    right = array[mid..-1]
    merge(merge_sort(left), merge_sort(right))
  end
end

def merge(left,right)
  sorted = []
  until left.empty? || right.empty?
    if left.first > right.first
      sorted << right.shift
    else
      sorted << left.shift
    end
  end
  sorted += left + right
end

p merge_sort(%w[i n s e r t i o n s o r t])
