load './min_heap.rb'

def can_build_heap
  elements = [12, 8, 6, 6, 5, 3, 1]
  min_heap = MinHeap.new(elements)
  if min_heap.elements == [1, 6, 3, 12, 6, 8, 5]
    puts "+ MinHeap is correctly built"
  else
    puts "- MinHeap was built wrongly"
  end
end

can_build_heap

def can_build_heap_1
  elements = [35, 33, 42, 10, 14, 19, 27, 44, 26, 31]
  min_heap = MinHeap.new(elements)
  if min_heap.elements == [10, 14, 19, 26, 31, 42, 27, 44, 35, 33]
    puts "+ MinHeap is correctly built"
  else
    puts "- MinHeap was built wrongly"
  end
end

can_build_heap_1

def count_plus_one_after_insert
  elements = [12, 8, 6, 6, 5, 3, 1]
  min_heap = MinHeap.new(elements)
  min_heap.insert(20)

  if min_heap.elements.length == elements.length + 1
    puts "+ count_plus_one_after_insert passes"
  else
    puts "- count_plus_one_after_insert failed"
  end
end

count_plus_one_after_insert

def can_insert_new_element
  elements = [12, 8, 6, 6, 5, 3, 1]
  min_heap = MinHeap.new(elements)
  min_heap.insert(2)

  if min_heap.elements == [1, 2, 3, 6, 6, 8, 5, 12]
    puts "+ MinHeap#insert is correctly built"
  else
    puts "- MinHeap#insert was built wrongly"
  end
end

can_insert_new_element

def can_remove_element
  elements = [12, 8, 6, 6, 5, 3, 1]
  min_heap = MinHeap.new(elements)
  min_heap.remove

  if min_heap.elements == [3, 6, 5, 12, 6, 8]
    puts "+ MinHeap#remove is correctly built"
  else
    puts "- MinHeap#remove was built wrongly"
  end
end

can_remove_element
