require 'awesome_print'
# BST
class BinarySearchTree
  # Node struct of BST
  class Node
    attr_accessor :value, :left, :right, :parent

    def initialize(value, left=nil, right=nil, parent=nil)
      self.value = value
      self.left = left
      self.right = right
      self.parent = parent
    end
  end

  attr_accessor :root

  # The building process of BST is to insert nodes into the tree one by one
  def initialize(data_array)
    raise Exception.new("parameter should be an Array of data!") unless data_array.is_a?(Array)

    self.root = nil

    data_array.each do |data|
      self.insert(data)
    end
  end

  def insert(data, node=self.root, parent_node=nil)
    unless node
      # if the tree is empty
      # node = Node.new(data)
      if parent_node
        if parent_node.value == data
          return 0
        elsif parent_node.value > data
          node = Node.new(data)
          parent_node.left = node
          node.parent = parent_node
        else
          node = Node.new(data)
          parent_node.right = node
          node.parent = parent_node
        end
      else
        self.root = Node.new(data)
      end
    else
      if data == node.value
        return 0
      elsif data < node.value
        self.insert(data, node.left, node)
      else
        self.insert(data, node.right, node)
      end
    end
    self
  end

  def insert_non_recursive(data, node=self.root, parent=nil)
    # TODO: non-recursion solution:
    #   1. if root is nil, directly assign node to root
    #   2. else, go through the tree, judge data and current node value, till the leaf node
    #   3. create a Node for data, add parent pointer, and add left/right pointer to its parent
  end

  def print
    node = self.root
    queue = Queue.new
    queue.push node

    current_level = node.parent.object_id
    print_level_array = []

    while !queue.empty? do
      node = queue.pop

      # ap "node value: #{node.value}; left: #{node.left.value}; right: #{node.right.value}"
      left = node.left
      right = node.right

      ap "node: #{node.value}; left: #{left ? node.left.value : 'NIL'}; right: #{right ? node.right.value : 'NIL'}"
      
      queue.push(left) if left
      queue.push(right) if right

    end
  end
end
