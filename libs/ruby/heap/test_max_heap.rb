load './max_heap.rb'

def can_build_heap
  elements = [3, 6, 5, 1, 12, 6, 8]
  max_heap = MaxHeap.new(elements)
  if max_heap.elements == [12, 6, 8, 1, 3, 5, 6]
    puts "+ MaxHeap is correctly built"
  else
    puts "- MaxHeap was built wrongly"
  end
end

can_build_heap

def can_build_heap_1
  elements = [35, 33, 42, 10, 14, 19, 27, 44, 26, 31]
  max_heap = MaxHeap.new(elements)
  if max_heap.elements == [44, 42, 35, 33, 31, 19, 27, 10, 26, 14]
    puts "+ MaxHeap is correctly built"
  else
    puts "- MaxHeap was built wrongly"
  end
end

can_build_heap_1


def count_plus_one_after_insert
  elements = [3, 6, 5, 1, 12, 6, 8]
  max_heap = MaxHeap.new(elements)
  max_heap.insert(20)

  if max_heap.elements.length == elements.length + 1
    puts "+ count_plus_one_after_insert passes"
  else
    puts "- count_plus_one_after_insert failed"
  end
end

count_plus_one_after_insert

def can_insert_new_element
  elements = [3, 6, 5, 1, 12, 6, 8]
  max_heap = MaxHeap.new(elements)
  max_heap.insert(20)

  if max_heap.elements == [20, 12, 8, 6, 3, 5, 6, 1]
    puts "+ MaxHeap#insert is correctly built"
  else
    puts "- MaxHeap#insert was built wrongly"
  end
end

can_insert_new_element

def can_remove_element
  elements = [3, 6, 5, 1, 12, 6, 8]
  max_heap = MaxHeap.new(elements)
  max_heap.remove

  if max_heap.elements == [8, 6, 6, 1, 3, 5]
    puts "+ MaxHeap#remove is correctly built"
  else
    puts "- MaxHeap#remove was built wrongly"
  end
end

can_remove_element

