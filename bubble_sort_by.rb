def bubble_sort_by(arr)
  swapped = true
  while swapped
    swapped = false 
    arr.each_with_index do |x, y|
      break if arr.length == y+1
      answer = yield(x, arr[y+1])
      if answer > 0
        swapped = true
        arr[y], arr[y+1] = arr[y+1], arr[y]
      end
    end
  end 
  arr
end

bubble_sort_by(["hi","hello","hey", "hefffff", 'hy']) do |left, right|
  left.length - right.length
end
