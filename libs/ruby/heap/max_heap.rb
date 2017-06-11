load './heap.rb'

class MaxHeap < Heap
  def initialize(elements)
    super(elements)
  end

  # insert a new element into the heap
  def insert(new_element)
    self.elements.push(new_element)
    self.heapify_from_tail
  end

  # Remove an element from MaxHeap
  # Usually this element can only by the root element(the max element)
  def remove
    return self.elements if self.elements.length == 0
    # swap the root and the last node
    swap(0, self.elements.length-1)
    # remove the last element(was the root)
    self.elements.pop
    self.heapify_from_root
  end

  # @return self.elements
  def heapify_from_root
    return self.elements if self.elements.length < 2
    # start from root element, when removed new element
    current_index = 0
    children_indices = children_indices_of(current_index)

    # if there are still children to compare
    while children_indices.length > 0 do
      # a boolean to control the process
      stop_flag = true

      children_indices.each do |i|
        current_element = self.elements[current_index]
        target_element = self.elements[i]

        if current_element < target_element
          swap(current_index, i)
          current_index = i
          # if swap happens, set flag to false and continue the recursion
          stop_flag = false
        end
      end
      
      break if stop_flag
    end

    return self.elements
  end

  def heapify_from_tail
    return self.elements if self.elements.length < 2

    # start from the last element, when inserted new element
    current_index = self.elements.length - 1
    current_element = self.elements[current_index]

    while current_index > 0 do
      parent_index = parent_index_of(current_index)
      parent_element = self.elements[parent_index]
      if parent_element < current_element
        swap(parent_index, current_index)
        current_index = parent_index
      else
        # if current element is smaller than parent, stop, heapify is done
        break
      end
    end

    self.elements
  end

  private

  def parent_index_of(index)
    ((index - 1) / 2).to_i
  end

  def children_indices_of(index)
    [index*2 + 1, index*2 + 2].select do |i|
      i < self.elements.length
    end
  end

  # swap 2 elements
  def swap(index1, index2)
    e1 = self.elements[index1]
    e2 = self.elements[index2]
    e_temp = e1
    self.elements[index1] = e2
    self.elements[index2] = e1
  end

end
