# implementation of Heap

class Heap
  attr_accessor :elements

  def initialize(elements)
    self.elements = []

    elements.each do |e|
      self.elements.push(e)
      self.heapify_from_tail
    end
  end

  def heapify_from_tail
    error = Exception.new("heapify_from_tail is not implemented!")
    raise error
  end

end
