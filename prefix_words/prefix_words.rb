load '../libs/ruby/tree/trie_tree.rb'

# Params:
#   @prefix: a prefix to be searched by
#   @dict: words dictionary(Array)
# Return: (Array)words

def prefix_words(prefix, dict)
  result = []
  tree = TrieTree.new(dict)
  
  # start iteration, to find starting node for DFS
  node = tree.root
  prefix.chars.each do |char|
    return results unless node

    child_index = char_index(char)
    node = node.children[child_index]
  end

  # start DFS
  path_stack = prefix.chars
  dfs(node, result, path_stack)
end

def dfs(node, result, path_stack)
  if node.count != 0
    # which means this is a leaf node, representing a word!
    result.push(path_stack.join())
  end

  # enqueue all children of the node
  index = 0
  node.children.each do |child|
    if !child.nil?
      path_stack.push(char_at_index(index))
      dfs(child, result, path_stack)
    end
    index += 1
  end
  path_stack.pop

  result
end

# mimic 'c' - 'a'
def char_index(char)
  TrieTree::ALPHABET[char] - TrieTree::ALPHABET['a']
end

def char_at_index(index)
  TrieTree::ALPHABET.keys[index]
end

### Test

def test_prefix_words
  data = ["cat", "cad", "car", "category", "mouse", "column", "api", "casual", "coral", "data", "pick", "no", "yes", "nope"]

  {
    'ca' => ["cat", "cad", "car", "category", "casual"], 
    'mo' => ["mouse"], 
    'co' => ["coral", "column"], 
    'no' => ["no", "nope"]
  }.each_pair do |prefix, assumption|
    words = prefix_words(prefix, data)

    if words.sort == assumption.sort
      puts "+ prefix_words passes! Found #{words.join(', ')} with prefix #{prefix}."
    else
      puts "- prefix_words failed on prefix #{prefix}."
    end
  end
end

test_prefix_words
