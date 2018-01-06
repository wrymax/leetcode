### PatriciaTrie ruby implementation
=begin

* Trie Tree

Operations:
  1.Remove a word "test"
    1) Start from root to the leaf to see if "test" if a word. If there exists a path of t-e-s-t and the leaf of last "t" is null, then we know that test is an existing word.
    2) Start removing nodes from the leaf "t" to the root. Don't stop removing until we find a node that has more than 1 children.
    3) COMPLEXITY: O(mN). m = the length of word. N = alphabet length.
  2.Search a word "test"
    1) The process of 1-1). 
    2) Complexity: O(m), m = word length

* Space-optimized TrieTree

Key idea: make characters in each node as many as possible, to compress the space of the trie tree

Main functions:
  1.Build Patricia Trie
    1) Initialize the trie with a root.
    2) Iterate the words array, add words one by one:
  2.Add word
    [1] If there is only root, then add the word as a node under the root;
    [2] If there is already words in the trie:
      * Start from the root, compare the current word "w" with the node "n" character by character:
        * if w is totally contained in n, then do nothing;
        * if w has difference with n, then 
          * make a new node parent_n as n's parent
          * make n's previous parent as parent_n's parent
          * parent_n has the common part of n and w
          * modify n to only have different part of w
          * make a new node w1 as parent_n's child that contains the difference of w and parent_n
  3.Search
  4.Remove a word

=end

class PatriciaTrie
  # class for nodes in the trie
  class Node
    attr_accessor :string, :children, :parent, :leaf
    
    def initialize(string=nil, parent=nil)
      self.string = string
      self.parent = parent
      self.leaf = false
      self.children = {}
    end
  end
  
  attr_accessor :root
  
  def initialize(words)
    self.root = Node.new
    
    words.each do |word|
      insert(word)
    end
  end
  
  # Add a new word in the trie
  def insert(word)
    return false if word.length == 0
    
    puts "\n>> inserting word /#{word}/"
    
    if root.children.empty?
      node = Node.new(word, root)
      puts "[1] insert /#{word}/ as child of root"
      root.children[word[0]] = node
    else
      children_key = word[0]
      target_child = root.children[children_key]
      
      puts "[2] target_child is /#{target_child.string}/"
      
      while target_child do
        puts "------ A new loop of target_child --------"
        target_length = target_child.string.length
        word_length = word.length
                
        # compare the two strings to find common part
        common_string = ""
        # the index of last character that is in common string
        final_index = -1
        
        0.upto(target_length-1) do |index|
          if index > word_length - 1
            # if current index exceeds the length of word
            break
          end
          
          if target_child.string[index] == word[index]
            # this character is common
            common_string += word[index]
            final_index = index
          else
            break
          end
        end
        
        if final_index == -1
          # no common string, then attach new_node directly
          new_node = Node.new(word, target_child.parent)
          target_child.parent.children[word[0]] = new_node
        elsif final_index == target_length - 1
          # if the target_child is totally covered          
          if final_index < word_length - 1
            # and if the word is not totally covered
            diff_in_word = word[(final_index+1)..(word_length-1)]
            
            if target_child.children[diff_in_word[0]]
              # if the word is not fully traversed, then update target_child and go on doing the loop
              target_child = target_child.children[word[final_index+1]]
              word = word[(final_index+1)..(word_length-1)]
              
              puts "[3] next target_child is /#{target_child.string}/; and word becomes /#{word}/"
            else
              new_node = Node.new(diff_in_word, target_child)
              target_child.children[diff_in_word[0]] = new_node
              
              puts "[4] add new node /#{new_node.string}/ as child of /#{target_child.string}/"
              break
            end
          else
            # if the word is totally covered, make target_child a leaf
            target_child.leaf = true
            puts "[5] there is a new word that ends at existing /#{target_child.string}/ (no extra node needed)"
            break
          end
        elsif final_index < target_length -1
          # if the target_child is not totally covered          
          common_node = Node.new(common_string, target_child.parent)
          puts "[6] make common node /#{common_node.string}/"
          
          diff_in_target = target_child.string[(final_index+1)..(target_length-1)]
          puts "[7] update current target_child to diff_in_target /#{diff_in_target}/ as child of common_node: /#{common_node.string}/"
          target_child.string = diff_in_target
          target_child.parent.children[common_string[0]] = common_node
          target_child.parent = common_node
          common_node.children[diff_in_target[0]] = target_child                    
          
          if final_index == word_length - 1                        
            # if the word is totally covered
            # make it a leaf, to specify there is word that ends here
            common_node.leaf = true
            puts "[8] there is a new word that ends at /#{common_node.string}/"
            break
          elsif final_index < word_length - 1
            diff_in_word = word[(final_index+1)..(word_length-1)]        
            new_node = Node.new(diff_in_word, common_node)
            common_node.children[diff_in_word[0]] = new_node
            puts "[9] add diff_in_word /#{diff_in_word}/ as child of common_node: /#{common_node.string}/"
            break
          end
        end        
      end
    end
  end
  
  # remove a word
  def remove(word)
  end
  
  # search a word
  def search(word)
  end
  
  # print the trie levels
  def print
    node = root
    
    print_node(node, "> ")
  end
  
  private
  
  def print_node(node, prefix="")
    suffix = node.leaf ? "(this is a leaf, a word ends here)" : ""
    body = node.string.nil? ? "Root" : node.string
    puts prefix + body + suffix
    
    if node.children.any?
      node.children.each_pair do |key, child_node|
        print_node(child_node, "  " + prefix)
      end
    end    
  end
  
end