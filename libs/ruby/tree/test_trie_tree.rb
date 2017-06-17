load './trie_tree.rb'

def test_insert
  tree = TrieTree.new
  tree.insert('cat')

  begin
    count = tree.root.children[2].children[0].children[19].count
    if count == 1
      puts "+ insert passeds!"
    else
      puts "- insert failed!"
    end
  rescue
    puts "- TrieTree was not correctly built when inserting string 'cat'"
  end
end

test_insert

def test_search
  data = {
    'cat' => 2, 
    'car' => 1, 
    'mouse' => 1, 
    'alphabet' => 1, 
    'phenomenon' => 1
  }
  tree = TrieTree.new
  data.each_pair do |k, v|
    v.times do
      tree.insert(k)
    end
  end
  
  begin
    data.each_pair do |k, v|
      count = tree.search(k)

      if count == v
        puts "+ search \"#{k}\" with count #{v}: passes!"
      else
        puts "- search \"#{k}\" with count #{v}: failed."
      end
    end
  rescue
  end
end

test_search
