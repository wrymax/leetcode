load './binary_search_tree.rb'

def test_bst_build
  data = [10, 20, 15, 16, 1, 3, 5, 8]
  tree = BinarySearchTree.new(data)

  tree.print
end

test_bst_build
