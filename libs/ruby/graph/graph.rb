# Node of ajacent list
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    self.value = value
    self.next_node = next_node
  end
end

# use Adjacent List to represent Graph
class AdjacentList
  attr_accessor :head_node

  def initialize(head_node=nil)
    self.head_node = head_node
  end
end


class Graph
  attr_accessor :adj_list_array, :dict

  def initialize(filename)
    self.adj_list_array = []
    # use a dict to maintain index of elements in adjacent list
    self.dict = {}

    # init with a graph file
    data = parse_file(filename)
    build_from_data(data)
  end

  # add an edge between 2 nodes
  def add_edge(element1, element2)
    index1 = self.dict[element1]
    index2 = self.dict[element2]
    raise Exception.new("Nodes not exist!") unless index1 && index2

    head_node2 = self.adj_list_array[index2].head_node
    new_node1 = Node.new(element1, head_node2.next_node)
    head_node2.next_node = new_node1


    head_node1 = self.adj_list_array[index1].head_node
    new_node2 = Node.new(element2, head_node1.next_node)
    head_node1.next_node = new_node2

    self
  end

  def print
    self.adj_list_array.each do |list|
      node = list.head_node
      arr = []
      while node do
        arr.push(node.value)
        node = node.next_node
      end
      puts arr.join(" -> ")
    end

    self.dict.each_pair do |key, value|
      puts "#{key} is at: self.adj_list_array[#{value}]" 
    end

    nil
  end

  private

  def parse_file(filename)
    file = File.open(filename)
    data = []
    file.each_line do |line|
      arr = line.strip.split(',')
      data.push arr
    end
    
    data
  end

  def build_from_data(data)
    data.each do |list_data|
      adjacent_list = AdjacentList.new
      list_data.reduce do |ele1, ele2|
        node2 = Node.new(ele2)

        if ele1.is_a?(Node)
          ele1.next_node = node2
        else
          node1 = Node.new(ele1, node2)
          adjacent_list.head_node = node1
          self.dict[node1.value] = self.adj_list_array.length
        end
        # return node2 to next reduce iteration
        node2
      end
      self.adj_list_array.push(adjacent_list)
    end
  end
end
