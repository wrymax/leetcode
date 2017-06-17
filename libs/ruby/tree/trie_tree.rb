class TrieTree
  attr_accessor :root

  ALPHABET_SIZE = 26
  index = 0
  ALPHABET = ('a'..'z').inject({}) do |hash, char|
    hash[char] = index += 1
    hash
  end

  # TreeNode is node of TrieTree
  class TreeNode
    # count is for recording word frequency
    attr_accessor :count, :children

    def initialize
      self.count = 0
      self.children = Array.new(ALPHABET_SIZE, nil)
    end
  end


  # initialize with a root node
  def initialize(dictionary=nil)
    self.root = TreeNode.new

    if dictionary
      raise Exception.new("parameter dictionary should be an Array of words!") unless dictionary.is_a?(Array)

      dictionary.each do |word|
        self.insert(word)
      end
    end
  end

  # insert a word into TrieTree
  def insert(word)
    # "cat" => ['c', 'a', 't']
    # char_array = word.chars
    node = self.root
    index = 0

    while node do
      char = word[index]
      # break unless char

      child_index = char_index(char)

      target_node = node.children[child_index]
      # puts "index: #{index}; node: #{node}; target_node: #{target_node}"
      if target_node
        # TODO: figure out where to add count
      else
        node.children[child_index] = TreeNode.new
      end

      if index == word.length - 1
        node.children[child_index].count += 1
        break
      end

      node = node.children[child_index]
      index += 1
    end

    self
  end

  # search a word frequency in TrieTree
  def search(word)
    char_array = word.chars
    node = self.root

    char_array.each do |char|
      node = node.children[char_index(char)]
      return 0 unless node
    end

    node.count
  end

  private

  # mimic 'c' - 'a'
  def char_index(char)
    ALPHABET[char] - ALPHABET['a']
  end
end
