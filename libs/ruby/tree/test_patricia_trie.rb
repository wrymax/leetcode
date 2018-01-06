load './patricia_trie.rb'

words = ["romane", "romanus", "romulus", "rubens", "ruber", "rubicon", "rubicundus"]
p_trie = PatriciaTrie.new(words)

p_trie.print