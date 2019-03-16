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


p isSorted? [1,2,0,4,5]
p bubblesort [6,5,3,1,8,7,2,4]
