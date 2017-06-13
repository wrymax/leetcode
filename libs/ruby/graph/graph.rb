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

  # Breadth-First Search
  def bfs(node_name, &block)
    # use a queue to save nodes to be operated
    queue = Queue.new

    # use a visited array to store visit status
    visited = Array.new(self.adj_list_array.length, 0)

    # start with a node
    index = self.dict[node_name]
    adj_list = self.adj_list_array[index]
    node = adj_list.head_node

    # operate node first
    push_node_to_queue(queue, node, visited)
    
    while !queue.empty? do
      current_node = queue.pop

      if block_given?
        yield current_node 
      else
        puts "Node #{current_node.value} is operated!"
      end

      adj_nodes = adjacent_nodes(current_node.value)
      adj_nodes.each do |n|
        push_node_to_queue(queue, n, visited) unless visited?(visited, n)
      end
    end

    puts "Breadth-First Search ends."
  end

  # Depth-First Search
  def dfs(node_name, &block)
    # use a visited array to store visit status
    visited = Array.new(self.adj_list_array.length, 0)

    # start recursion
    dfs_loop(node_name, visited, &block)

    puts "Depth-Frist Search ends."
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

  # build Graph from scratch
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

  def adjacent_nodes(node_name)
    result = []
    index = self.dict[node_name]
    return nil unless index

    adj_list = self.adj_list_array[index]

    node = adj_list.head_node
    next_node = node.next_node
    while next_node do
      result.push(next_node)
      next_node = next_node.next_node
    end

    result
  end

  def push_node_to_queue(queue, node, visited)
    queue.push(node)
    visited[self.dict[node.value]] = 1
  end

  def visited?(visited, node)
    visited[self.dict[node.value]] == 1
  end

  def dfs_loop(node_name, visited, &block)
    # mark as visited
    index = self.dict[node_name]
    adj_nodes = adjacent_nodes(node_name)
    node = self.adj_list_array[index].head_node

    visited[index] = 1
    if block_given?
      yield node
    else
      puts "#{node.value} is visited."
    end

    adj_nodes.each do |adj_node|
      adj_node_index = self.dict[adj_node.value]
      # puts "adj_node_index = #{adj_node_index}; node = #{adj_node.value}"
      # puts "visited[adj_node_index] = #{visited[adj_node_index]}"
      dfs_loop(adj_node.value, visited, &block) if visited[adj_node_index] == 0
    end
  end
end
