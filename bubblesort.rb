def bubblesort(unsorted)
  orderedList = []
  greater = unsorted[0]
  nextN = 0
  for index in 1...unsorted.length
    if unsorted[index] >= greater
      orderedList << greater
      greater = unsorted[index]
    else
      orderedList << unsorted[index]
    end
    nextN = greater
  end
  orderedList << nextN
  if isSorted? orderedList then orderedList else bubblesort orderedList end 
end

def isSorted? list
  next_num = 0
  for num in list
    if num >= next_num
      next_num = num
    else
      return false
    end
  end
  return true;
end

def bubblesort_2(unsorted)
  swapped = true
  while swapped
    swapped= false
    for index in 0..unsorted.length
      break if index+1 == unsorted.length
      if unsorted[index] > unsorted[index + 1]
        unsorted[index], unsorted[index + 1] = unsorted[index+1], unsorted[index]
        swapped = true
      end
    end
  end
  unsorted 
end

p isSorted? [1,2,0,4,5]
p bubblesort_2 [6,5,3,1,8,7,2,4]
